import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation.dart';
import 'package:get/get.dart';

class OrganisationController extends GetxController {
  // usecases
  final GetOrganisation getOrganisation;

  OrganisationController({
    required this.getOrganisation,
  });

  // states
  OrganisationState organisationState = OrganisationState.initial;

// data
  List<OrganisationModel> organisationList = [];

// ids
  final String organisationId = "organisation_id";

  // additional
  int? organisationValue;
  OrganisationModel? selectedOrganisation;

  @override
  void onInit() {
    getOrganisationList();
    super.onInit();
  }

  void getOrganisationList() async {
    updateOrganisationState(OrganisationState.loading);
    Get.log("GetOrganisationController ");
    final result = await getOrganisation.call(NoParams());
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
      updateOrganisationState(OrganisationState.error);
    }, (res) {
      organisationList = res;
      Get.log("Organisation Controller list => $organisationList");
      updateOrganisationState(OrganisationState.loaded);
    });
  }

  void updateOrganisationState(OrganisationState state) {
    organisationState = state;
    update([organisationId]);
  }
}

enum OrganisationState { initial, loading, loaded, error }
