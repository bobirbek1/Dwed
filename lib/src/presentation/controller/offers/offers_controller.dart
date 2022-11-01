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

  //refreshController for offers' first page that has TV, fashion and card items
  late final RefreshController refreshControllerSearchPage;

  //refreshController for offers' second page that has vertical electronic items in figma
  late final RefreshController refreshControllerForSubPage;

  //refreshController for offers' third page that has vertical and grid item
  late final RefreshController refreshController;


  OffersController({
    required this.getOffers,
    required this.getOffersChild,
    required this.getOffersDetails,
  });

  // states
  OffersState offersState = OffersState.initial;

  // data
  List<OffersModel> offersList = []; // list for search page items
  List<OffersModel> offersChildList = []; // list for sub page
  List<OffersDetailsModel> offersDetailsList = []; // list for details page

  int? id;

  // ids
  final String offersId = "offers_id";
  final String offersChildId = "offers_child_id";
  final String offersDetailsId = "offers_details_id";

  // additional
  int? offersValue;
  OffersModel? selectOffersModel;

  // offsets for count of items
  int offsetForOffersList = 0;
  int offsetForSubPage = 0;
  int gridOffSet = 0;
  int horizontalOffSet = 0;

  var hasSubsChild;
  var hasSubs;

  @override
  void onInit() {
    refreshController = RefreshController(initialRefresh: true);
    refreshControllerSearchPage = RefreshController(initialRefresh: true);
    refreshControllerForSubPage = RefreshController(initialRefresh: true);
   // getOffersList();
    super.onInit();
  }

  void onLoadingForSearchPage() {
    getOffersList();
  }

  void onRefreshForSearchPage() {
    getOffersList();
  }

  void onLoadingAndRefreshForSubpage() {
    getOffersChildList();
  }


  void getOffersList() async {
    Get.log("GetOffersController ");
    final result = await getOffers.call(GetOffersParams(offset: offsetForOffersList));
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
      refreshControllerSearchPage.loadFailed();
    }, (res) {
      offersList.addAll(res);
      hasSubs = offersList[0].hasSubs;
      offsetForOffersList = offersList.length;
      Get.log("Offers Controller list => $offersList");
      updateOffersState(OffersState.loaded);
      refreshControllerSearchPage.loadComplete();
      refreshControllerSearchPage.refreshCompleted();
    });
  }

  void getOffersChildList() async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersChild.call(GetOffersChildParams(
        id: selectOffersModel!.id!, offset: offsetForSubPage));
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
      refreshControllerForSubPage.loadFailed();
      refreshControllerForSubPage.refreshFailed();
      updateOffersChildState(OffersState.error);
      updateOffersDetailsState(OffersState.error);
    }, (res) {
      horizontalOffSet = offersChildList.length;
      offersChildList.addAll(res);
      hasSubsChild = offersChildList[0].hasSubs;
      Get.log("OffersChild Controller list => $offersChildList");
      refreshControllerForSubPage.loadComplete();
      refreshControllerForSubPage.refreshCompleted();
      offsetForSubPage = res.length;
      updateOffersChildState(OffersState.loaded);
      updateOffersDetailsState(OffersState.loaded);
    });
  }

  void getOffersDetailsList() async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersDetails.call(
        GetOffersDetailsParams(id: selectOffersModel!.id!, offset: gridOffSet));
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
      refreshController.refreshFailed();
      updateOffersDetailsState(OffersState.error);
    }, (res) {
      offersDetailsList.addAll(res);
      gridOffSet = offersDetailsList.length;
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
