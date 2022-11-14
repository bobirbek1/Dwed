import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
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

  StreamController(
      {required this.getMessages,
      required this.sendMessage,
      required this.getDetails,
      required this.getStreams});

  // refresh controllers
  final streamController = RefreshController();

  // video player controllers
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  // UI states
  bool _isMessagePressed = false;
  bool hasText = false;

  // data
  final List<StreamModel> streamList = [];
  List<MessageModel> chatMessages = [];
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

// typing variable which means search is active or not
  bool typing = true;

//text editing controllers
  final searchTextController = TextEditingController();
  final messageTextController = TextEditingController();

  // selected stream
  StreamModel? _selectedStream;

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
    super.onInit();
  }

  @override
  void onClose() {
    messageTextController.dispose();
    streamController.dispose();
    videoController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  initializeVideo() {
    if (videoController != null) {
      videoController?.dispose();
    }
    if (chewieController != null) {
      chewieController?.dispose();
    }
    videoController = VideoPlayerController.network(
        "https://m.dwed.biz/v1.0/api/streaming/${selectedStream?.channelSlug}/live.m3u8");
    chewieController = ChewieController(
      videoPlayerController: videoController!,
      aspectRatio:
          SizeConfig.screenWidth! / SizeConfig.calculateBlockVertical(240),
      isLive: true,
    );
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
        Get.log("OffersChild Error");
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
        Get.log("OffersChild Error");
      }
      updateStreamDetailsState(StreamState.error);
    }, (response) {
      streamDetails = response;
      updateStreamDetailsState(StreamState.loaded);
    });
  }

  void getChatMessages() async {
    updateChatState(StreamState.loading);
    final result = await getMessages
        .call(MessageParams(slugName: selectedStream?.channelSlug ?? "tmeduz"));
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("OffersChild Error");
      }
      updateChatState(StreamState.error);
    }, (response) {
      chatMessages = response.reversed.toList();
      updateChatState(StreamState.loaded);
    });
  }

  void sendChatMessage() async {
    final result = await sendMessage.call(
      SendMessageParams(
        slugName: selectedStream?.channelSlug ?? "tmeduz",
        text: messageTextController.text,
      ),
    );
    messageTextController.clear();
    result.fold((failure) {
      Get.log("send message return error: $failure");
    }, (response) {
      Get.log("send message success: $response");
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
