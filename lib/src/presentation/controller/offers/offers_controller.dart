import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/details_model_for_products_page.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/usecase/getOffersChild.dart';
import 'package:flutter_template/src/domain/usecase/getProductPageItem.dart';
import 'package:flutter_template/src/domain/usecase/get_offers.dart';
import 'package:flutter_template/src/domain/usecase/get_offers_detail.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../app/app_routes.dart';

class OffersController extends GetxController {
  // usecases
  final GetOffers getOffers;
  final GetOffersChild getOffersChild;
  final GetOffersDetails getOffersDetails;
  final GetProductPageItem getProductPageItem;

  ///refreshControllers
  //refreshController for offers' first page that has TV, fashion and card items
  late final RefreshController refreshControllerSearchPage;
  //refreshController for offers' second page that has vertical electronic items in figma
  late final RefreshController refreshControllerForSubPage;
  //refreshController for offers' third page that has vertical electronic items in figma
  late final RefreshController refreshControllerForSubSubPage;
  //refreshController for offers' third page that has vertical and grid item
  late final RefreshController refreshController;

  OffersController({
    required this.getOffers,
    required this.getOffersChild,
    required this.getOffersDetails,
    required this.getProductPageItem,
  });

  /// states
  OffersState offersState = OffersState.initial;
  OffersState offersStateProductPage = OffersState.initial;

  /// data
  List<OffersModel> offersList = []; // list for search page items
  List<OffersModel> offersChildList = []; // list for sub page
  List<OffersModel> offersSubSubList = []; // list for sub page
  List<OffersDetailsModel> offersDetailsList = []; // list for details page

  ///used to know next page is null or not
  bool searchPageNext = true;
  bool subPageNext = true;
  bool subSubPageNext = true;
  bool detailsPageNext = true;

  int? id;

  /// ids
  final String offersId = "offers_id";
  final String offersChildId = "offers_child_id";
  final String offersSubSubId = "offers_sub_sub_id";
  final String offersDetailsId = "offers_details_id";

  /// additional
  int? offersValue;

  ///data pressed
  //data that is pressed on search page and its information will be showed in sub page
  OffersModel? selectOffersModel;
  //data that is pressed on sub page and its information will be showed in sub page
  OffersModel? selectOffersModelInSubPage;
  //data that is pressed on sub sub page and its information will be showed in sub details page
  OffersModel? selectOffersModelInSubSubPage;
  OffersDetailsModel? selectDetailsModel; // item clicked in details page

  ///item for product page
  late DetailsModelForProductsPage productsPageItem;

  /// offsets for count of items
  int offsetForOffersList = 0;
  int offsetForSubPage = 0;
  int offsetSubSub = 0;
  int offsetDetails = 0;

  /// it is used for choosing the items Sort By or Filter int details page
  Sorting sortType = Sorting.sortBy;

  @override
  void onInit() {
    refreshController = RefreshController(initialRefresh: true);
    refreshControllerSearchPage = RefreshController(initialRefresh: true);
    refreshControllerForSubPage = RefreshController(initialRefresh: true);
    refreshControllerForSubSubPage = RefreshController(initialRefresh: true);
    super.onInit();
  }

  ///is called when item in offers page is clicked
  void itemClicked(OffersModel data) {
    selectOffersModel = data;
    final argument = data.name;
    final subs = data.hasSubs ?? false;
    if (subs) {
      Get.toNamed(
        AppRoutes.OFFERS_SUB_PAGE,
        arguments: argument,
      );
    } else {
      selectOffersModelInSubPage = null;  // it is done to check and find id for details
      selectOffersModelInSubSubPage = null;
      Get.toNamed(
        AppRoutes.OFFERS_SUB_DETAILS_PAGE,
        arguments: argument,
      );
    }
  }
  void onLoadingForSearchPage() {
    if(searchPageNext) {
      getOffersList();
    }else {
      refreshControllerSearchPage.loadNoData();
    }
  }
  void onRefreshForSearchPage() {
    offersList.clear();
    offsetForOffersList = 0;
    getOffersList();
  }


  ///called when item in sub page is clicked
  void itemInSubClicked(OffersModel data) {
    final argument = data.name;
    selectOffersModelInSubPage = data;
    final sub = data.hasSubs ?? false;
    if(sub) {
      Get.toNamed(
        AppRoutes.OFFERS_SUB_SUB_PAGE,
        arguments: argument,
      );
    }else {
      selectOffersModelInSubSubPage = null;
      Get.toNamed(
        AppRoutes.OFFERS_SUB_DETAILS_PAGE,
        arguments: argument,
      );
    }
  }
  void getOffersList() async {
    Get.log("GetOffersController ");
    final result =
        await getOffers.call(GetOffersParams(offset: offsetForOffersList));
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
      searchPageNext = false;
      updateOffersState(OffersState.error);
      refreshControllerSearchPage.loadFailed();
      refreshControllerSearchPage.refreshFailed();
    }, (res) {
      searchPageNext = res['next'] == false ? false : true;
      offersList.addAll(res['results']);
      offsetForOffersList = offersList.length;
      Get.log("Offers Controller list => $offersList");
      updateOffersState(OffersState.loaded);
      refreshControllerSearchPage.loadComplete();
      refreshControllerSearchPage.refreshCompleted();
    });
  }
  void getOffersChildList(OffersModel data,
      RefreshController refreshControllerThis,
      List<OffersModel> list,
      Function function,
      int offSetThis,
      bool next
      )
  async {
    updateOffersChildState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersChild.call(GetOffersChildParams(
        id: data.id!, offset: offsetForSubPage));
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
      next = false;
      refreshControllerThis.refreshFailed();
      refreshControllerThis.loadFailed();
      function(OffersState.error);
    }, (res) {
      next = res['next'] == false ? false : true;
      list.addAll(res['results']);
      offSetThis = list.length;
      refreshControllerThis.loadComplete();
      refreshControllerThis.refreshCompleted();
      function(OffersState.loaded);

      // horizontalOffSet = offersChildList.length;
      // offersChildList.addAll(res);
      // hasSubsChild = offersChildList[0].hasSubs;
      // Get.log("OffersChild Controller list => $offersChildList");
      // refreshControllerForSubPage.loadComplete();
      // refreshControllerForSubPage.refreshCompleted();
      // refreshControllerForSubSubPage.refreshCompleted();
      // refreshControllerForSubSubPage.loadComplete();
      // offsetForSubPage = res.length;
      // updateOffersChildState(OffersState.loaded);
      // updateOffersDetailsState(OffersState.loaded);
    });
  }
  void onLoadingForSubpage() {
    if(subPageNext) {
      getOffersChildList(selectOffersModel!,refreshControllerForSubPage, offersChildList, updateOffersChildState,offsetForSubPage, subPageNext);
    }else {
      refreshControllerForSubPage.loadNoData();
    }
  }
  void onRefreshForSubPage() {
    offsetForSubPage = 0;
    offersChildList.clear();
    getOffersChildList(selectOffersModel!,refreshControllerForSubPage, offersChildList, updateOffersChildState,offsetForSubPage, subPageNext);
  }


  ///SubSubPage
  void itemClickedInSubSubPage(OffersModel data) {
    selectOffersModelInSubSubPage = data;
    final argument = data.name;
    Get.toNamed(
      AppRoutes.OFFERS_SUB_DETAILS_PAGE,
      arguments: argument,
    );
  }
  void onLoadingForSubSubPage() {
    if(subSubPageNext) {
      getOffersChildList(selectOffersModelInSubPage!,refreshControllerForSubSubPage, offersSubSubList, updateSubSub,offsetSubSub , subSubPageNext);
    }else {
      refreshControllerForSubSubPage.loadNoData();
    }
  }
  void onRefreshForSubSubpage() {
    offersSubSubList.clear();
    offsetSubSub = 0;
    getOffersChildList(selectOffersModelInSubPage!,refreshControllerForSubSubPage, offersSubSubList, updateSubSub,offsetSubSub, subSubPageNext);
    Get.log("Offers Sub page data => ${offersSubSubList.length}}");
  }

  ///Item is loading for offers product page from https://m.dwed.biz/v1.0/api/orgs/perfumer/offerings/3380/
  void loadDataForProductPage(OffersDetailsModel data) async {
    offersStateProductPage = OffersState.loading;
    Get.log("get product page controller");
    final result = await getProductPageItem.call(GetProductPageItemParams(type: data.org!.slugName!, id: data.id!));
    Get.log("get product page controller result ${result}");
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
      offersStateProductPage = OffersState.error;
    }, (result)  {
      offersStateProductPage = OffersState.loaded;
      Get.log("product page item result => ${result}");
      productsPageItem = result;
    });
  }

  ///DetailsPage
  void onItemClickedDetailsPage(OffersDetailsModel data) {
    selectDetailsModel = data;
    loadDataForProductPage(data);
    Get.toNamed(AppRoutes.ITEM_DETAILS_PAGE, arguments: data.name);
  }
  void onLoadingForDetailsPage() {
    if(detailsPageNext) {
      int id = 0;
      if(selectOffersModelInSubSubPage != null) {
        id = selectOffersModelInSubSubPage!.id ?? 0;
      }else if(selectOffersModelInSubPage != null){
        id = selectOffersModelInSubSubPage!.id ?? 0;
      }else {
        id = selectOffersModel!.id ?? 0;
      }
      getOffersDetailsList(id, detailsPageNext);
    }else{
      refreshController.loadNoData();
    }
  }
  void onRefreshForDetailsPage() {
    offsetDetails = 0;
    offersDetailsList.clear();
    int id = 0;
    if(selectOffersModelInSubSubPage != null) {
      id = selectOffersModelInSubSubPage!.id ?? 0;
    }else if(selectOffersModelInSubPage != null){
      id = selectOffersModelInSubSubPage!.id ?? 0;
    }else {
      id = selectOffersModel!.id ?? 0;
    }
    getOffersDetailsList(id, detailsPageNext);
  }
  void getOffersDetailsList(int id, bool next) async {
    updateOffersDetailsState(OffersState.loading);
    Get.log("GetOffersController ");
    final result = await getOffersDetails.call(
        GetOffersDetailsParams(id: id, offset: offsetDetails));
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
      refreshController.loadFailed();
      refreshController.refreshFailed();
      updateOffersDetailsState(OffersState.error);
    }, (res) {
      next = res['next'] == null ? false : true;
      offersDetailsList.addAll(res['results']);
      offsetDetails = offersDetailsList.length;
      Get.log("OffersDetails Controller list => $offersDetailsList");
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      updateOffersDetailsState(OffersState.loaded);
    });
  }

  ///for updating the screen in searchPage
  void updateOffersState(OffersState state) {
    offersState = state;
    update([offersId]);
  }

  ///for updating the screen in sub page
  void updateOffersChildState(OffersState state) {
    offersState = state;
    update([offersChildId]);
  }

  void updateOffersDetailsState(OffersState state) {
    offersState = state;
    update([offersDetailsId]);
  }

  ///updates or changes the item type in the details screen to grid or vertical
  void updateItemType(Sorting sort) {
    sortType = sort;
    update([offersDetailsId]);
  }

  void updateSubSub(OffersState state) {
    update([offersSubSubId]);
  }
}

enum OffersState { initial, loading, loaded, error }

  ///is ued for  choosing the type of sort in the details screen grid item or vertical
enum Sorting { sortBy, filter }
