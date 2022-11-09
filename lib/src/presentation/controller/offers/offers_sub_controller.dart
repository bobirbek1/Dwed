

import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/usecase/getOffersChild.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  OffersModel? selectOffersModelInSubPage;


  //offsets
  int offset = 0;
  int offsetForDetails = 0;

  //refreshControllers
  RefreshController refreshController = RefreshController(initialRefresh: true);

  ///called when item in sub page is clicked
  void itemInSubClicked(OffersModel data) {
    final argument = data.name;
    selectOffersModelInSubPage = data;
    getOffersChildList();
    Get.toNamed(
      AppRoutes.OFFERS_SUB_DETAILS_PAGE,
      arguments: argument,
    );
  }

  void getOffersChildList() async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersSubController ");
    final result = await getOffersChild
        .call(GetOffersChildParams(id: selectOffersModel!.id!, offset: offset));
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
      refreshController.refreshFailed();
      refreshController.loadFailed();
      updateOffersChildState(OffersState.error);
    }, (res) {
      offersChildList = res['results'];
      offset = offersChildList.length;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      Get.log("OffersChild Controller list => $offersChildList");
      updateOffersChildState(OffersState.loaded);
    });
  }

  void getOffersDetailsList() async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersSubController ");
    final result = await getOffersDetails
        .call(GetOffersDetailsParams(id: selectOffersModel!.id!, offset: offsetForDetails));
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
      offersDetailsList.addAll(res['results']);
      offsetForDetails = offersDetailsList.length;
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
