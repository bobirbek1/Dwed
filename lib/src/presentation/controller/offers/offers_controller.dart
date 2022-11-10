import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/offers/offer_details_model.dart';
import 'package:flutter_template/src/data/model/offers/offer_gallery.dart';
import 'package:flutter_template/src/data/model/offers/offer_model.dart';
import 'package:flutter_template/src/data/model/offers/offers_cat_model.dart';
import 'package:flutter_template/src/domain/usecase/get_offer_gallery.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_child.dart';
import 'package:flutter_template/src/domain/usecase/get_product_page_item.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../app/app_routes.dart';

class OffersController extends GetxController {
  // usecases
  final GetOffersCat getOffersCat;
  final GetOffersSubCat getOffersSubCat;
  final GetOffers getOffers;
  final GetOfferGallery getOfferGallery;
  final GetProductPageItem getProductPageItem;

  ///refreshControllers
  //refreshController for offers' first page that has TV, fashion and card items
  late final RefreshController offersCatController;
  //refreshController for offers' second page that has vertical electronic items in figma
  late final RefreshController offersSubCatController;
  //refreshController for offers' third page that has vertical electronic items in figma
  late final RefreshController offersSubSubCatController;
  //refreshController for offers' third page that has vertical and grid item
  late final RefreshController offersController;

  OffersController({
    required this.getOffersCat,
    required this.getOffersSubCat,
    required this.getOffers,
    required this.getOfferGallery,
    required this.getProductPageItem,
  });

  /// states
  OffersState offersCatState = OffersState.initial;
  OffersState offersSubCatState = OffersState.initial;
  OffersState offersSubSubCatState = OffersState.initial;
  OffersState offersState = OffersState.initial;
  OffersState offerDetailsState = OffersState.initial;

  /// data
  List<OffersCatModel> offersCatList = []; // list for search page items
  List<OffersCatModel> offersSubCatList = []; // list for sub page
  List<OffersCatModel> offersSubSubCatList = []; // list for sub page
  List<OfferModel> offersList = []; // list for details page
  Map<int, List<OfferGallery>> offerGalleries = {};

  ///used to know next page is null or not
  bool offersCatNext = true;
  bool offersSubCatNext = true;
  bool offersSubSubCatNext = true;
  bool offersNext = true;

  int? id;

  /// ids
  final String offersCatId = "offers_cat_id";
  final String offersSubCatId = "offers_sub_cat_id";
  final String offersSubSubCatId = "offers_sub_sub_cat_id";
  final String offersId = "offers_id";
  final String offerDetailsId = "offers_details_id";
  final String carouselId = "carousel_id";

  /// additional
  int? offersValue;

  ///data pressed
  //data that is pressed on search page and its information will be showed in sub page
  OffersCatModel? selectedOffersCat;
  //data that is pressed on sub page and its information will be showed in sub page
  OffersCatModel? selectedOffersSubCat;
  //data that is pressed on sub sub page and its information will be showed in sub details page
  OffersCatModel? selectedOffersSubSubCat;
  OfferModel? selectedOffer; // item clicked in details page

  ///item for product page
  late OfferDetailsModel offerDetails;

  /// offsets for count of items
  int offersCatOffset = 0;
  int offersSubCatOffset = 0;
  int offersSubSubCatOffset = 0;
  int offersOffset = 0;

  // carousel index in offerDetailsPage
  int currentPage = 0;

  /// it is used for choosing the items Sort By or Filter int details page
  Sorting sortType = Sorting.sortBy;

  @override
  void onInit() {
    offersController = RefreshController(initialRefresh: true);
    offersCatController = RefreshController(initialRefresh: true);
    offersSubCatController = RefreshController(initialRefresh: true);
    offersSubSubCatController = RefreshController(initialRefresh: true);
    super.onInit();
  }

  @override
  void onClose() {
    offersCatController.dispose();
    offersController.dispose();
    offersSubCatController.dispose();
    offersSubSubCatController.dispose();
    super.onClose();
  }

  ///is called when item in offers page is clicked
  void itemClicked(OffersCatModel data) {
    selectedOffersCat = data;
    final argument = data.name;
    final subs = data.hasSubs ?? false;
    if (subs) {
      Get.toNamed(
        AppRoutes.OFFERS_SUB_PAGE,
        arguments: argument,
      );
    } else {
      selectedOffersSubCat =
          null; // it is done to check and find id for details
      selectedOffersSubSubCat = null;
      Get.toNamed(
        AppRoutes.OFFERS_SUB_DETAILS_PAGE,
        arguments: argument,
      );
    }
  }

  void loadingOffersCat() {
    if (offersCatNext) {
      getOffersCatList();
    } else {
      offersCatController.loadNoData();
    }
  }

  void refreshOffersCat() {
    offersCatList.clear();
    offersCatOffset = 0;
    getOffersCatList();
  }

  ///called when item in sub page is clicked
  void itemInSubClicked(OffersCatModel data) {
    final argument = data.name;
    selectedOffersSubCat = data;
    final sub = data.hasSubs ?? false;
    if (sub) {
      Get.toNamed(
        AppRoutes.OFFERS_SUB_SUB_PAGE,
        arguments: argument,
      );
    } else {
      selectedOffersSubSubCat = null;
      Get.toNamed(
        AppRoutes.OFFERS_SUB_DETAILS_PAGE,
        arguments: argument,
      );
    }
  }

  void getOffersCatList() async {
    final result =
        await getOffersCat.call(GetOffersParams(offset: offersCatOffset));
    Get.log("Get offers result $result");
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
      offersCatNext = false;
      updateOffersCatState(OffersState.error);
      offersCatController.loadFailed();
      offersCatController.refreshFailed();
    }, (res) {
      offersCatNext = res['next'] != null;
      offersCatList.addAll(res['results']);
      offersCatOffset = offersCatList.length;
      Get.log("Offers Controller list => $offersCatList");
      updateOffersCatState(OffersState.loaded);
      offersCatController.loadComplete();
      offersCatController.refreshCompleted();
    });
  }

  void getOffersSubCatsList(
    OffersCatModel data,
    bool isSubSub,
  ) async {
    isSubSub
        ? updateOffersSubSubCatState(OffersState.loading)
        : updateOffersSubCatState(OffersState.loading);
    Get.log("getOffersChildList ==> called");
    final result = await getOffersSubCat.call(GetOffersChildParams(
        id: data.id!,
        offset: isSubSub ? offersSubSubCatOffset : offersSubCatOffset));
    Get.log("Get offersChild result ==> $result");
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
      isSubSub
          ? offersSubSubCatController.refreshFailed()
          : offersSubCatController.refreshFailed();
      isSubSub
          ? offersSubSubCatController.loadFailed()
          : offersSubCatController.loadFailed();
      isSubSub
          ? updateOffersSubSubCatState(OffersState.error)
          : updateOffersSubCatState(OffersState.error);
    }, (res) {
      if (isSubSub) {
        offersSubSubCatNext = res['next'] != null;
        offersSubSubCatList.addAll(res['results']);
        offersSubSubCatOffset = list.length;
        offersSubSubCatController.loadComplete();
        offersSubSubCatController.refreshCompleted();
        updateOffersSubSubCatState(OffersState.loaded);
      } else {
        offersSubCatNext = res['next'] != null;
        offersSubCatList.addAll(res['results']);
        offersSubCatOffset = list.length;
        offersSubCatController.loadComplete();
        offersSubCatController.refreshCompleted();
        updateOffersSubCatState(OffersState.loaded);
      }
    });
  }

  void loadingOffersSubCat() {
    if (offersSubCatNext) {
      getOffersSubCatsList(selectedOffersCat!, false);
    } else {
      offersSubCatController.loadNoData();
    }
  }

  void refreshOffersSubCat() {
    offersSubCatOffset = 0;
    offersSubCatList.clear();
    getOffersSubCatsList(selectedOffersCat!, false);
  }

  void loadingOffersSubSubCat() {
    if (offersSubSubCatNext) {
      getOffersSubCatsList(selectedOffersSubCat!, true);
    } else {
      offersSubSubCatController.loadNoData();
    }
  }

  void refreshOffersSubSubCat() {
    offersSubSubCatList.clear();
    offersSubSubCatOffset = 0;
    getOffersSubCatsList(selectedOffersSubCat!, true);
  }

  ///SubSubPage
  void itemClickedInSubSubPage(OffersCatModel data) {
    selectedOffersSubSubCat = data;
    final argument = data.name;
    Get.toNamed(
      AppRoutes.OFFERS_SUB_DETAILS_PAGE,
      arguments: argument,
    );
  }

  ///Item is loading for offers product page from https://m.dwed.biz/v1.0/api/orgs/perfumer/offerings/3380/
  void getOfferDetails(OfferModel data) async {
    updateOfferDetailsState(OffersState.loading);
    final result = await getProductPageItem.call(
        GetProductPageItemParams(type: data.org!.slugName!, id: data.id!));
    Get.log("get product page controller result $result");
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
      updateOfferDetailsState(OffersState.error);
    }, (result) {
      offersState = OffersState.loaded;
      offerDetails = result;
      getOfferGalleries(result.id!);
      updateOfferDetailsState(OffersState.loaded);
    });
  }

  getOfferGalleries(int id) async {
    final result = await getOfferGallery.call(
      OfferGalleryParams(id: id),
    );
    result.fold((failure) {
      Get.log("getOfferGalleries error: $failure");
    }, (response) {
      Get.log("getOfferGalleries success: $response");
      offerGalleries[id] = response;
      update([carouselId]);
    });
  }

  ///DetailsPage
  void onItemClickedDetailsPage(OfferModel data) {
    selectedOffer = data;
    getOfferDetails(data);
    Get.toNamed(AppRoutes.ITEM_DETAILS_PAGE, arguments: data.name);
  }

  void loadingOffers() {
    if (offersNext) {
      int id = 0;
      if (selectedOffersSubSubCat != null) {
        id = selectedOffersSubSubCat!.id ?? 0;
      } else if (selectedOffersSubCat != null) {
        id = selectedOffersSubSubCat!.id ?? 0;
      } else {
        id = selectedOffersCat!.id ?? 0;
      }
      getOffersList(id, offersNext);
    } else {
      offersController.loadNoData();
    }
  }

  void refreshOffers() {
    offersOffset = 0;
    offersList.clear();
    int id = 0;
    if (selectedOffersSubSubCat != null) {
      id = selectedOffersSubSubCat!.id ?? 0;
    } else if (selectedOffersSubCat != null) {
      id = selectedOffersSubSubCat!.id ?? 0;
    } else {
      id = selectedOffersCat!.id ?? 0;
    }
    getOffersList(id, offersNext);
  }

  void getOffersList(int id, bool next) async {
    updateOffersState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffers
        .call(GetOffersDetailsParams(id: id, offset: offersOffset));
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
      next = false;
      offersController.loadFailed();
      offersController.refreshFailed();
      updateOffersState(OffersState.error);
    }, (res) {
      next = res['next'] != null;
      offersList.addAll(res['results']);
      offersOffset = offersList.length;
      Get.log("OffersDetails Controller list => $offersList");
      offersController.loadComplete();
      offersController.refreshCompleted();
      updateOffersState(OffersState.loaded);
    });
  }

  ///for updating the screen in searchPage
  void updateOffersCatState(OffersState state) {
    offersCatState = state;
    update([offersCatId]);
  }

  void updateOffersState(OffersState state) {
    offersState = state;
    update([offersId]);
  }

  ///updates or changes the item type in the details screen to grid or vertical
  void updateItemType(Sorting sort) {
    sortType = sort;
    update([offersId]);
  }

  updateOffersSubCatState(OffersState state) {
    offersSubCatState = state;
    update([offersSubCatId]);
  }

  updateOffersSubSubCatState(OffersState state) {
    offersSubSubCatState = state;
    update([offersSubSubCatId]);
  }

  void updateOfferDetailsState(OffersState state) {
    offerDetailsState = state;
    update([offerDetailsId]);
  }

  void onPageChanged(int index) {
    currentPage = index;
    update([carouselId]);
  }
}

enum OffersState { initial, loading, loaded, error }

///is ued for  choosing the type of sort in the details screen grid item or vertical
enum Sorting { sortBy, filter }
