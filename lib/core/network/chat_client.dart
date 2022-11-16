import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChatClient {
  late Client _client;

  StreamSubscription<ConnectEvent>? _connectSub;
  StreamSubscription<DisconnectEvent>? _disconnSub;
  StreamSubscription<ErrorEvent>? _errorSub;
  StreamSubscription<String>? _publish;
  StreamSubscription<JoinEvent>? _join;
  StreamSubscription<LeaveEvent>? _leave;
  StreamSubscription<SubscribeSuccessEvent>? _subscribeSuccess;
  StreamSubscription<SubscribeErrorEvent>? _subscribeError;
  StreamSubscription<UnsubscribeEvent>? _unsubscribe;

  late StreamSubscription<MessageEvent> _msgSub;

  Subscription? subscription;
  final _chatMsgController = StreamController<MessageModel>();

  Stream<MessageModel> get messages => _chatMsgController.stream;

  void init(
    String token,
  ) {
    const url = 'ws://py.dwed.biz/centrifugo/connection/websocket';
    _client = createClient(
      url,
    );
    _client.setToken(token);
    _msgSub = _client.messageStream.listen((event) {
      Get.log("Msg: $event");
    });
  }

  Future<void> connect(VoidCallback onConnect) async {
    Get.log(
        "Connecting to Centrifugo server at wss://py.dwed.biz/centrifugo/connection/websocket");
    _connectSub = _client.connectStream.listen((event) {
      Get.log("Connected to server");
      Fluttertoast.showToast(
          msg: "Centrifugo server connected",
          backgroundColor: Colors.green,
          textColor: Colors.white);
      onConnect();
    });
    _disconnSub = _client.disconnectStream.listen((event) {
      Get.log("Disconnected from server");
      Fluttertoast.showToast(
          msg: "Centrifugo server disconnected",
          backgroundColor: Colors.red,
          textColor: Colors.white);
    });
    _errorSub = _client.errorStream.listen((event) {
      Get.log("centrifuge connect error: ${event}");
    });
    await _client.connect();
  }

  Future<void> subscribe(String channel) async {
    Get.log("Subscribing to channel $channel");
    if (subscription != null && subscription!.channel == channel) {
      return;
    }
    await unsubscribe();
    subscription = _client.getSubscription(channel);
    _publish = subscription?.publishStream
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {
      final d = json.decode(data) as Map<String, dynamic>;
      _chatMsgController.sink.add(MessageModel.fromJson(d));
      Get.log("subscription publication: data => $d");
    });
    _join = subscription?.joinStream.listen(print);
    _leave = subscription?.leaveStream.listen(print);
    _subscribeSuccess = subscription?.subscribeSuccessStream.listen(print);
    _subscribeError = subscription?.subscribeErrorStream.listen(print);
    _unsubscribe = subscription?.unsubscribeStream.listen(print);
    await subscription?.subscribe();
  }

  Future<void> dispose() async {
    await _connectSub?.cancel();
    await _disconnSub?.cancel();
    await _errorSub?.cancel();
    await _msgSub.cancel();
    await _chatMsgController.close();
    await unsubscribe();
  }

  Future<void> sendMsg(String text) async {
    final output = jsonEncode({
      'text': text,
    });
    Get.log("Sending msg : $output");
    final data = utf8.encode(output);
    try {
      await subscription?.publish(data);
    } on Exception {
      rethrow;
    }
  }

  Future<void> unsubscribe() async {
    await subscription?.unsubscribe();
    await _join?.cancel();
    await _leave?.cancel();
    await _publish?.cancel();
    await _subscribeError?.cancel();
    await _subscribeSuccess?.cancel();
    await _unsubscribe?.cancel();
  }
}
