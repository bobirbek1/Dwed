import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation_details.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation_sub.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation_user_post.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrganisationController extends GetxController {
  /// useCases
  final GetOrganisation getOrganisation;
  final GetOrganisationSub getOrganisationSub;
  final GetOrganisationDetails getOrganisationDetails;
  final GetOrganisationUserPost getUserPost;

  OrganisationController(
      {required this.getOrganisation,
      required this.getOrganisationSub,
      required this.getUserPost,
      required this.getOrganisationDetails});

  /// states
  OrganisationState organisationState = OrganisationState.initial;
  OrganisationState organisationDetailsState = OrganisationState.initial;

  /// data
  List<OrganisationModel> organisationList =
      []; //used for main organisation page
  List<OrganisationModel> organisationSubList =
      []; //used for organisation sub page
  List<OrganisationDetailsModel> organisationDetailsList =
      []; //used for organisation sub page
  List<OrganisationModel> organisationUserPostPageList =
      []; //used for organisation sub page

  /// ids
  final String organisationId = "organisation_id";
  final String organisationSubId = "organisation_sub_id";
  final String organisationDetailsId = "organisation_details_id";
  final String organisationUserPostPage = "organisation_user_post_id";

  ///refreshControllers
  late final RefreshController refreshControllerOrganisations;
  late final RefreshController refreshControllerOrganisationsSubPage;
  late final RefreshController refreshControllerOrganisationsDetailsPage;
  late final RefreshController refreshControllerOrganisationsUserPostPage;

  @override
  void onInit() {
    refreshControllerOrganisations = RefreshController(initialRefresh: true);
    refreshControllerOrganisationsSubPage =
        RefreshController(initialRefresh: true);
    refreshControllerOrganisationsDetailsPage =
        RefreshController(initialRefresh: true);
    refreshControllerOrganisationsUserPostPage =
        RefreshController(initialRefresh: true);
    super.onInit();
  }

  ///offsets
  int offsetOrganisation = 0;
  int offsetOrganisationSub = 0;
  int offsetOrganisationDetails = 0;

  ///used to know next page is exist or not
  bool organisationNext = true;
  bool organisationSubNext = true;
  bool organisationSubDetails = true;
  bool organisationUserPostNext = true;

  /// additional
  int? organisationValue;

  ///selected items
  OrganisationModel? selectedOrganisation; // item selected in organisation page
  OrganisationModel?
      selectedOrganisationSub; // item selected in organisation Sub page
  OrganisationModel?
      selectedOrganisationDetails; // item selected in organisation Sub page

  ///clicked item
  OrganisationModel?
      selectedOrganisationUserPost; // item selected in organisation pages and showed in user post page

  ///Organisation Details Page
  void onLoadingForDetailsPage() {
    loadOrganisationDetailsList(selectedOrganisation!,
        refreshControllerOrganisationsDetailsPage, organisationDetailsState, updateOrganisationsDetails);
  }
  void onRefreshForDetailsPage() {
    offsetOrganisationDetails = 0;
    organisationDetailsList.clear();
    loadOrganisationDetailsList(selectedOrganisation!,
        refreshControllerOrganisationsDetailsPage, organisationDetailsState, updateOrganisationsDetails);
  }
  void onClickItemForDetailsPage(OrganisationDetailsModel data) {
    
  }

  void loadOrganisationDetailsList(OrganisationModel data,
      RefreshController refreshController, OrganisationState state, Function update) async {
    Get.log("get organisation details controller");
    state = OrganisationState.loading;
    final result = await getOrganisationDetails.call(
        GetOrganisationDetailsParams(
            slugName: data.slugName!, offSet: offsetOrganisationDetails));
    Get.log("get organisation details controller result => $result");
    result.fold((failure) {
      Get.log("get organisation controller failure  => ${failure.toString()}");
      refreshController.loadFailed();
      refreshController.refreshFailed();
      state = OrganisationState.error;
      updateOrganisationsDetails(OrganisationState.error);
    }, (r) {
      organisationDetailsList.addAll(r);
      Get.log(
          "get organisation details controller result => $organisationDetailsList");
      state = OrganisationState.loaded;
      refreshControllerOrganisationsDetailsPage.loadComplete();
      refreshControllerOrganisationsDetailsPage.refreshCompleted();
      offsetOrganisationDetails = organisationDetailsList.length;
      updateOrganisationsDetails(OrganisationState.loaded);
    });
  }

  ///Organisation Page
  void onLoadingForOrganisationPage() {
    if (organisationNext) {
      getOrganisationList(refreshControllerOrganisations);
    } else {
      refreshControllerOrganisations.loadNoData();
    }
  }

  void onRefreshForOrganisationPage() {
    offsetOrganisation = 0;
    organisationList.clear();
    getOrganisationList(refreshControllerOrganisations);
  }

  void onClickOrganisationItem(OrganisationModel data) {
    selectedOrganisation = data;
    if (data.category!.hasSubs != null ? data.category!.hasSubs! : false) {
      Get.toNamed(
        AppRoutes.ORGANIZATIONS_SUB_PAGE,
        arguments: data.name!,
      );
    } else {
      getOrganisationUserPos(data.slugName!);
      selectedOrganisationUserPost = data;
      Get.toNamed(AppRoutes.ORGANIZATIONS_SUB_DETAILS_PAGE,
          arguments: data.name);
    }
  }

  ///OrganisationSubPage
  void onLoadingForOrganisationSubPage() {
    if (organisationSubNext) {
      getOrganisationSubList(
          offsetOrganisationSub,
          selectedOrganisationSub!.category!.slug!,
          refreshControllerOrganisationsSubPage,
          organisationSubList,
          organisationSubNext);
    } else {
      refreshControllerOrganisationsSubPage.loadNoData();
    }
  }

  void onRefreshForOrganisationSubPage() {
    organisationSubList.clear();
    offsetOrganisationSub = 0;
    getOrganisationSubList(
        offsetOrganisationSub,
        selectedOrganisationSub!.category!.slug!,
        refreshControllerOrganisationsSubPage,
        organisationSubList,
        organisationSubNext);
  }

  void onClickOrganisationSubPageItem(OrganisationModel data) {
    selectedOrganisationSub = data;
    if (data.category!.hasSubs!) {
      Get.toNamed(
        AppRoutes.ORGANIZATIONS_SUB_DETAILS_PAGE,
        arguments: data.name,
      );
    } else {
      selectedOrganisationUserPost = selectedOrganisationSub;
      getOrganisationUserPos(data.slugName!);
      Get.toNamed(
        AppRoutes.USER_POST_PAGE,
        arguments: data.name,
      );
    }
  }

  ///Organisation List
  void getOrganisationList(RefreshController refreshController) async {
    updateOrganisationState(OrganisationState.loading);
    Get.log("GetOrganisationController ");
    final result = await getOrganisation
        .call(GetOrganisationParams(offset: offsetOrganisation));
    Get.log("Get organisation result ${result}");
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log(
            "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                .tr);
      } else if (failure is ServerTimeOutFailure) {
        Get.log("tarmoq_ulanishingizni_tekshiring".tr);
      } else {
        Get.log("Organisation Error");
      }
      refreshControllerOrganisations.loadFailed();
      refreshControllerOrganisations.refreshFailed();
      updateOrganisationState(OrganisationState.error);
    }, (res) {
      organisationList.addAll(res['results']);
      organisationNext = res['next'];
      offsetOrganisation = organisationList.length;
      refreshControllerOrganisations.loadComplete();
      refreshControllerOrganisations.refreshCompleted();
      Get.log("Organisation Controller list => $organisationList");
      updateOrganisationState(OrganisationState.loaded);
    });
  }

  ///Organisation Sub List
  void getOrganisationSubList(
      int offset,
      String category,
      RefreshController refreshController,
      List<OrganisationModel> list,
      bool next) async {
    updateOrganisationSubState(OrganisationState.loading);
    Get.log("request for organization sub list");
    final result = await getOrganisationSub
        .call(GetOrganisationSubParams(offset: offset, category: category));
    Get.log('organisation sub list => + $result');
    result.fold(
        (failure) => {
              if (failure is NetworkFailure)
                {
                  Get.log(
                      "internetga_ulanish_muvaffaqiyatsiz_tugadi_iltimos_yana_bir_bor_urinib_koring"
                          .tr),
                }
              else if (failure is ServerTimeOutFailure)
                {
                  Get.log("tarmoq_ulanishingizni_tekshiring".tr),
                }
              else
                {
                  Get.log("Organisation Error"),
                },
              refreshController.loadFailed(),
              refreshController.refreshFailed(),
              updateOrganisationSubState(OrganisationState.error)
            },
        (response) => {
              list.addAll(response['result']),
              next = response['next'],
              offset = list.length,
              refreshControllerOrganisationsSubPage.refreshCompleted(),
              refreshControllerOrganisationsSubPage.loadComplete(),
              Get.log("Organisation Controller Sub list => $list")
            });
  }

  void getOrganisationUserPos(String slugName) async {
    final res = await getUserPost
        .call(GetOrganisationUserPostParams(slugName: slugName));
    res.fold((l) => () {}, (r) => selectedOrganisationUserPost = r);
  }

  ///Organisation Page
  void updateOrganisationState(OrganisationState state) {
    organisationState = state;
    update([organisationId]);
  }

  ///Organisation Sub Page
  void updateOrganisationSubState(OrganisationState state) {
    update([organisationSubId]);
  }

  ///Organisation details
  void updateOrganisationsDetails(OrganisationState state) {
    update([organisationDetailsId]);
  }
}

enum OrganisationState { initial, loading, loaded, error }
