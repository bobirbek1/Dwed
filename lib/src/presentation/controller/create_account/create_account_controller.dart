import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/domain/usecase/create_account.dart';
import 'package:flutter_template/src/domain/usecase/get_sector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/domain/usecase/get_speciality.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  // usecases
  final CreateAccount createAccount;
  final GetSector getSector;
  final GetSpecialty getSpecialty;

  CreateAccountController(
      {required this.createAccount,
      required this.getSector,
      required this.getSpecialty});

  // text controllers

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final surnameController = TextEditingController();
  final nickNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final specialtyController = TextEditingController();
  final liveAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final verifyCodeController = TextEditingController();

  // states
  CreateAccountState sectorState = CreateAccountState.initial;
  CreateAccountState specialityState = CreateAccountState.initial;
  CreateAccountState createAccountState = CreateAccountState.initial;

  // text field errors
  String? nameError;
  String? surnameError;
  String? userNameError;
  String? birthdayError;
  String? genderError;
  String? specialtyError;
  String? liveAddressError;
  String? phoneNumberError;
  String? passwordError;
  String? confirmPasswordError;
  String? verifyCodeError;

  // data
  List<Sector> sectorList = [];
  List<Speciality> specialityList = [];

  // ids
  final String nameId = "create_account_name_id";
  final String birthdayId = "create_account_birthday_id";
  final String genderId = "create_account_gender_id";
  final String specialityId = "create_account_speciality_id";
  final String liveAddressId = "create_account_address_id";
  final String phoneNumberId = "create_account_phone_number_id";
  final String passwordId = "create_account_password_id";
  final String resetCodeVerifyId = "create_account_password_id";
  // final String checkBoxId = "check_box_id";

  // additional
  int? specialityValue;
  Speciality? selectedSpec;

  void signUp() async {
    if (validatePassword()) {
      updateCreateAccountState(CreateAccountState.loading);
      final result = await createAccount.call(
        CreateAccountParams(
          gender: genderController.text,
          specialty: specialtyController.text,
          liveAddress: liveAddressController.text,
          birthday: birthdayController.text,
          name: nameController.text,
          phone: phoneNumberController.text,
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log("Internet connection is failed! Please try again");
        } else if (failure is ServerTimeOutFailure) {
          Get.log("Please check your network connection!");
        } else {}
        updateCreateAccountState(CreateAccountState.error);
      }, (res) {
        updateCreateAccountState(CreateAccountState.loaded);
      });
    }
  }

  void getSectorList() async {
    updateSpecialityState(CreateAccountState.loading);
    final result = await getSector.call(NoParams());
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log("Internet connection is failed! Please try again");
      } else if (failure is ServerTimeOutFailure) {
        Get.log("Please check your network connection!");
      } else {}
      updateSpecialityState(CreateAccountState.error);
    }, (res) {
      sectorList = res.results ?? [];
      updateSpecialityState(CreateAccountState.loaded);
    });
  }

  void getSpecialityList(String slug) async {
    updateSpecialityState(CreateAccountState.loading);
    final result = await getSpecialty.call(SpecialtyParams(sectorName: slug));
    result.fold((failure) {
      if (failure is NetworkFailure) {
        Get.log("Internet connection is failed! Please try again");
      } else if (failure is ServerTimeOutFailure) {
        Get.log("Please check your network connection!");
      } else {}
      updateSpecialityState(CreateAccountState.error);
    }, (res) {
      specialityList = res.results ?? [];
      updateSpecialityState(CreateAccountState.loaded);
    });
  }

  bool validateCreateAccountName() {
    var isValid = true;
    if (nameController.text.isEmpty) {
      nameError = "Username shouldn't be empty";
      isValid = false;
    } else {
      nameError = null;
    }
    if (usernameController.text.isEmpty) {
      userNameError = "Password shouldn't be empty";
      isValid = false;
    } else {
      userNameError = null;
    }
    update([nameId]);
    return isValid;
  }

  bool validateCreateAccountBirthday() {
    var isValid = true;
    if (birthdayController.text.isEmpty) {
      birthdayError = "Birthday shouldn't be empty";
      isValid = false;
    } else {
      birthdayError = null;
    }
    update([nameId]);
    return isValid;
  }

  bool validateCreateAccountGender() {
    var isValid = true;
    if (genderController.text.isEmpty) {
      genderError = "Username shouldn't be empty";
      isValid = false;
    } else {
      genderError = null;
    }
    update([nameId]);
    return isValid;
  }

  void updateLoginState(state) {
    specialityState = state;
    update([nameId]);
  }

  bool validateCreateAccountSpecialty() {
    var isValid = true;
    if (specialtyController.text.isEmpty) {
      specialtyError = "Speciality shouldn't be empty";
      isValid = false;
    } else {
      specialtyError = null;
    }
    update([nameId]);
    return isValid;
  }

  bool validateCreateAccountLiveAddress() {
    var isValid = true;
    if (liveAddressController.text.isEmpty) {
      liveAddressError = "Address shouldn't be empty";
      isValid = false;
    } else {
      liveAddressError = null;
    }

    update([nameId]);
    return isValid;
  }

  bool validatePhoneNumber() {
    var isValid = true;
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError = "Phone number shouldn't be empty";
      isValid = false;
    } else if (!phoneNumberController.text.isPhoneNumber) {
      phoneNumberError = "Enter correct phone number";
      isValid = false;
    } else {
      phoneNumberError = null;
    }
    update([phoneNumberId]);
    return isValid;
  }

  bool validatePassword() {
    var isValid = true;
    if (passwordController.text.isEmpty) {
      passwordError = "Password shouldn't be empty";
      isValid = false;
    } else {
      passwordError = null;
    }
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError = "Confirm password shouldn't be empty";
      isValid = false;
    } else {
      confirmPasswordError = null;
    }
    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordError = "Password doesn't match";
      isValid = false;
    } else {
      confirmPasswordError = null;
    }
    update([passwordId]);
    return isValid;
  }

  bool validateVerifyCode() {
    var isValid = true;
    if (verifyCodeController.text.isEmpty) {
      verifyCodeError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      verifyCodeError = null;
    }
    update([resetCodeVerifyId]);
    return isValid;
  }

  void updateCreateAccountState(CreateAccountState state) {
    specialityState = state;
    update([nameId]);
  }

  void updateSpecialityState(CreateAccountState state) {
    specialityState = state;
    update([specialityId]);
  }

  void changeSpecilityValue(val) {
    specialityValue = val;
    update([specialityId]);
  }

  void selectSpeciality() {
    print("specialit name ${selectedSpec?.name ?? ""}");
    specialtyController.text = selectedSpec?.name ?? "";
    update([specialityId]);
  }
}

enum CreateAccountState { initial, loading, loaded, error }
