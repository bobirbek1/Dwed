

import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/usecase/getOffersChild.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersController extends GetxController {
  // usecases
  final GetOffers getOffers;
  final GetOffersChild getOffersChild;
  final GetOffersDetails getOffersDetails;

  //
  late final RefreshController refreshController;

  OffersController({
    required this.getOffers,
    required this.getOffersChild,
    required this.getOffersDetails,
  });

  // states
  OffersState offersState = OffersState.initial;

// data
  List<OffersModel> offersList = [];
  List<OffersModel> offersChildList = []; //
  List<OffersDetailsModel> offersDetailsList = []; // list for grid items

  int? id;
  bool? hasSubs;
  bool? hasSubsChild;

// ids
  final String offersId = "offers_id";
  final String offersChildId = "offers_child_id";
  final String offersDetailsId = "offers_details_id";

  // additional
  int? offersValue;
  OffersModel? selectOffersModel;

  int gridOffSet = 0;
  int horizontalOffSet = 0;

  @override
  void onInit() {
    refreshController = RefreshController(initialRefresh: true);
    getOffersList();
    getOffersChildList();
    super.onInit();
  }

  void getOffersList() async {
    updateOffersState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffers.call(NoParams());
    Get.log("Get offers result ${result}");
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("Offers Error");
      }
      refreshController.loadFailed();
      updateOffersState(OffersState.error);
    }, (res) {
      offersList.addAll(res);
      hasSubs=offersList[0].hasSubs;
      Get.log("Offers Controller list => $offersList");
      refreshController.loadComplete();
      updateOffersState(OffersState.loaded);
    });
  }
  void getOffersChildList() async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersChild.call(GetOffersChildParams(id: selectOffersModel!.id!, offset: horizontalOffSet));
    Get.log("Get offersChild result ${result}");
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
      refreshController.loadFailed();
      updateOffersChildState(OffersState.error);
    }, (res) {
      horizontalOffSet += 10;
      offersChildList.addAll(res);
      hasSubsChild=offersChildList[0].hasSubs;
      Get.log("OffersChild Controller list => $offersChildList");
      refreshController.loadComplete();
      updateOffersChildState(OffersState.loaded);
    });
  }

  void getOffersDetailsList() async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersDetails.call(GetOffersDetailsParams(id: selectOffersModel!.id!, offset: gridOffSet));
    Get.log("Get offersDetails result $result");
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("OfferDetails Error");
      }
      refreshController.loadFailed();
      updateOffersDetailsState(OffersState.error);
    }, (res) {
      gridOffSet += 10;
      offersDetailsList.addAll(res);
      Get.log("OffersDetails Controller list => $offersDetailsList");
      refreshController.loadComplete();
      updateOffersDetailsState(OffersState.loaded);
    });
  }




  void updateOffersState(OffersState state) {
    offersState = state;
    update([offersId]);
  }
  void updateOffersChildState(OffersState state) {
    offersState = state;
    update([offersChildId]);
  }
  void updateOffersDetailsState(OffersState state) {
    offersState = state;
    update([offersDetailsId]);
  }
}

enum OffersState { initial, loading, loaded, error }
