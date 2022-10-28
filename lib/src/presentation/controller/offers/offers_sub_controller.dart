import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/usecase/getOffersChild.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:get/get.dart';

class OffersSubController extends GetxController {
  // usecases
  final GetOffers getOffers;
  final GetOffersChild getOffersChild;
  final GetOffersDetails getOffersDetails;

  OffersSubController({
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

// ids
  final String offersSubId = "offers_sub_id";
  final String offersSubChildId = "offers_sub_child_id";
  final String offersSubDetailsId = "offers_sub_details_id";

  // additional
  int? offersValue;
  OffersModel? selectOffersModel;

  void getOffersChildList() async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersSubController ");
    final result = await getOffersChild
        .call(GetOffersChildParams(id: selectOffersModel!.id!));
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
      Get.log("OffersChild Controller list => $offersChildList");
      updateOffersChildState(OffersState.loaded);
    });
  }

  void getOffersDetailsList() async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersSubController ");
    final result = await getOffersDetails
        .call(GetOffersDetailsParams(id: selectOffersModel!.id!));
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
    update([offersSubId]);
  }

  void updateOffersChildState(OffersState state) {
    offersState = state;
    update([offersSubChildId]);
  }

  void updateOffersDetailsState(OffersState state) {
    offersState = state;
    update([offersSubDetailsId]);
  }
}

enum OffersState { initial, loading, loaded, error }
