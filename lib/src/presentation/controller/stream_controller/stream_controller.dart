import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/network/chat_client.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:flutter_template/src/domain/usecase/get_centrifuge_token.dart';
import 'package:flutter_template/src/domain/usecase/get_chat_messages.dart';
import 'package:flutter_template/src/domain/usecase/get_stream_details.dart';
import 'package:flutter_template/src/domain/usecase/get_stream_list.dart';
import 'package:flutter_template/src/domain/usecase/send_message.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video_player/video_player.dart';

class StreamController extends GetxController {
  // usecases
  final GetStreamList getStreams;
  final GetStreamDetails getDetails;
  final GetChatMessages getMessages;
  final SendMessage sendMessage;
  final GetCentrifugeToken getToken;
  final ChatClient chatClient;

  StreamController({
    required this.getMessages,
    required this.sendMessage,
    required this.getDetails,
    required this.getStreams,
    required this.getToken,
    required this.chatClient,
  });

  // refresh controllers
  final streamController = RefreshController();

  // scroll controller
  final scrollController = ScrollController();

  // video player controllers
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  // UI states
  bool _isMessagePressed = false;
  bool hasText = false;

  // data
  final List<StreamModel> streamList = [];
  Map<String, List<MessageModel>> chatMessages = {};
  StreamDetailsModel? streamDetails;

  // getBuilder's ids
  final String streamListId = "stream_list_id";
  final String chatId = "chat_id";
  final String streamDetailsId = "stream_details_id";
  final String messageSendId = "message_send_id";

  // states
  StreamState streamListState = StreamState.initial;
  StreamState chatState = StreamState.initial;
  StreamState streamDetailsState = StreamState.initial;

  // offsets for pagination
  int streamListOffset = 0;
  int? chatOffset = 0;
  bool shouldCall = true;

// typing variable which means search is active or not
  bool typing = true;

//text editing controllers
  final searchTextController = TextEditingController();
  final messageTextController = TextEditingController();

  // selected stream
  StreamModel? _selectedStream;

  // message stream subscription
  StreamSubscription? subscription;

  // ignore: unnecessary_getters_setters
  StreamModel? get selectedStream => _selectedStream;

  set selectedStream(StreamModel? stream) => _selectedStream = stream;

  bool get isMessagePressed => _isMessagePressed;

  set isMessagePressed(bool value) {
    _isMessagePressed = value;
    update([streamDetailsId]);
  }

  @override
  void onInit() {
    _getStreamList();
    messageTextController.addListener(() {
      if (messageTextController.text.isNotEmpty && !hasText) {
        hasText = !hasText;
        update([messageSendId]);
      } else if (messageTextController.text.isEmpty && hasText) {
        hasText = !hasText;
        update([messageSendId]);
      }
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent - 100 <
              scrollController.offset &&
          shouldCall &&
          chatOffset != null) {
        shouldCall = false;
        getChatMessages();
      }
    });
    _getCentrifugeToken();
    super.onInit();
  }

  @override
  void onClose() {
    chatClient.dispose();
    scrollController.dispose();
    messageTextController.dispose();
    streamController.dispose();
    videoController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  Future<void> onBackFromDetails() async {
    await videoController?.dispose();
    chewieController?.dispose();
  }

  initializeVideo() {
    videoController = VideoPlayerController.network(
        "https://m.dwed.biz/v1.0/api/streaming/${selectedStream?.channelSlug}/live.m3u8");

    chewieController = ChewieController(
        videoPlayerController: videoController!,
        aspectRatio:
            SizeConfig.screenWidth! / SizeConfig.calculateBlockVertical(240),
        isLive: true,
        allowMuting: false,
        allowPlaybackSpeedChanging: false,
        showControls: false,
        showControlsOnInitialize: false,
        autoPlay: true);
    
  }

  void subscribeToChannel(String slugName) async {
    await chatClient.subscribe("stream_chat.$slugName");
  }

  void _initChatClient(
    String token,
  ) async {
    chatClient.init(token);
    await chatClient.connect(() {});
    if (subscription == null) {
      await subscription!.cancel();
    }
    subscription = chatClient.messages.listen((event) {
      chatMessages[selectedStream?.channelSlug]?.add(event);
      update([chatId]);
    });
  }

  void refreshStreamList() {
    streamList.clear();
    streamListOffset = 0;
    _getStreamList();
  }

  void loadStreamList() {
    if (streamList.isNotEmpty && streamList.first.next != null) {
      _getStreamList();
    } else {
      streamController.loadNoData();
    }
  }

  void _getStreamList() async {
    updateStreamListState(StreamState.loading);
    final result =
        await getStreams.call(StreamListParams(offset: streamListOffset));
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("GetStreamList Error");
      }
      updateStreamListState(StreamState.error);
    }, (response) {
      streamList.addAll(response);
      streamListOffset = streamList.length;
      updateStreamListState(StreamState.loaded);
    });
  }

  void getStreamDetails() async {
    updateStreamDetailsState(StreamState.loading);
    final result = await getDetails.call(StreamDetailsParams(
        orgSlugName: selectedStream?.channelSlug ?? "tmeduz"));
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("getStreamDetails Error");
      }
      updateStreamDetailsState(StreamState.error);
    }, (response) {
      streamDetails = response;
      updateStreamDetailsState(StreamState.loaded);
    });
  }

  void getChatMessages() async {
    if (chatOffset != null) {
      updateChatState(StreamState.loading);

      final result = await getMessages.call(MessageParams(
          slugName: selectedStream?.channelSlug ?? "tmeduz",
          offset: chatOffset!));
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log(
              "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                  .tr);
        } else if (failure is ServerTimeOutFailure) {
          Get.log("tarmoq_ulanishingizni_tekshiring".tr);
        } else {
          Get.log("getChatMessages Error");
        }
        updateChatState(StreamState.error);
      }, (response) {
        chatMessages[selectedStream?.channelSlug]
            ?.insertAll(0, response.reversed.toList());
        if (response.isNotEmpty) {
          chatOffset = response.first.next != null
              ? int.tryParse(response.first.next?.split("=").last ?? "")
              : null;
        }
        shouldCall = true;
        updateChatState(StreamState.loaded);
      });
    }
  }

  void sendChatMessage() async {
    final text = messageTextController.text;
    messageTextController.clear();
    final result = await sendMessage.call(
      SendMessageParams(
        slugName: selectedStream?.channelSlug ?? "tmeduz",
        text: text,
      ),
    );

    result.fold((failure) {
      Get.log("send message return error: $failure");
    }, (response) {
      Get.log("send message success: $response");
    });
  }

  void _getCentrifugeToken() async {
    final result = await getToken.call(NoParams());
    result.fold((failure) {
      Get.log("get centrifuge token return error: $failure");
    }, (response) {
      Get.log("get centrifuge token success: $response");
      _initChatClient(
        response,
      );
    });
  }

  void updateStreamListState(StreamState state) {
    streamListState = state;
    update([streamListId]);
  }

  void updateStreamDetailsState(StreamState state) {
    streamDetailsState = state;
    update([streamDetailsId]);
  }

  void updateChatState(StreamState state) {
    chatState = state;
    update([chatId]);
  }
}

enum StreamState { initial, loading, error, loaded }
