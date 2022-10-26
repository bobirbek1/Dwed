import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/usecase/getOffersChild.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  // usecases
  final GetOffers getOffers;
  final GetOffersChild getOffersChild;
  final GetOffersDetails getOffersDetails;

  OffersController({
    required this.getOffers,
    required this.getOffersChild,
    required this.getOffersDetails,
  });

  // states
  OffersState offersState = OffersState.initial;

// data
  List<OffersModel> offersList = [];
  List<OffersModel> offersChildList = [];
  List<OffersDetailsModel> offersDetailsList = [];
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

  @override
  void onInit() {
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
      updateOffersState(OffersState.error);
    }, (res) {
      offersList = res;
hasSubs=offersList[0].hasSubs;
      Get.log("Offers Controller list => $offersList");
      updateOffersState(OffersState.loaded);
    });
  }
  void getOffersChildList() async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersChild.call(GetOffersChildParams(id: selectOffersModel!.id!));
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
      updateOffersChildState(OffersState.error);
    }, (res) {
      offersChildList = res;
      hasSubsChild=offersChildList[0].hasSubs;
      Get.log("OffersChild Controller list => $offersChildList");
      updateOffersChildState(OffersState.loaded);
    });
  }

  void getOffersDetailsList() async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersDetails.call(GetOffersDetailsParams(id: selectOffersModel!.id!));
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
      updateOffersDetailsState(OffersState.error);
    }, (res) {
      offersDetailsList = res;
      Get.log("OffersDetails Controller list => $offersDetailsList");
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
