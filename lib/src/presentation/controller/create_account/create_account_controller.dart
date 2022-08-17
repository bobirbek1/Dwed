import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/domain/usecase/create_account.dart';
import 'package:flutter_template/src/domain/usecase/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  // usecases
  final CreateAccount createAccount;
  final Login login;

  CreateAccountController({required this.createAccount, required this.login});

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
  final passwordResetPasswordController = TextEditingController();
  final confirmResetPasswordController = TextEditingController();
  final phoneResetPasswordController = TextEditingController();
  final verifyResetPasswordController = TextEditingController();

  // states
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
  String? passwordResetError;
  String? confirmResetError;
  String? phoneResetError;
  String? verifyResetError;

  // data

  // ids
  final String createAccountNameId = "create_account_name_id";
  final String createAccountBirthdayId = "create_account_birthday_id";
  final String createAccountGenderId = "create_account_gender_id";
  final String createAccountSpecialityId = "create_account_speciality_id";
  final String createAccountLiveAddressId = "create_account_address_id";
  final String createAccountPhoneNumberId = "create_account_phone_number_id";
  final String createAccountPasswordId = "create_account_password_id";
  final String resetPasswordPasswordId = "create_account_password_id";
  final String resetPasswordPhoneId = "create_account_password_id";
  final String resetPasswordverifyId = "create_account_password_id";


  // final String checkBoxId = "check_box_id";

  void signUp() async {
    if (validateCreateAccountPassword()) {
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
        } else {

        }
        updateCreateAccountState(CreateAccountState.error);
      }, (res) {
        updateCreateAccountState(CreateAccountState.loaded);
      });
    }


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
    if (!isValid) {
      update([createAccountNameId]);
    }
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

    if (!isValid) {
      update([createAccountNameId]);
    }
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

    if (!isValid) {
      update([createAccountNameId]);
    }
    return isValid;

  }
  void updateLoginState( state) {
    createAccountState = state;
    update([createAccountNameId]);
  }
  bool validateCreateAccountSpecialty() {
    var isValid = true;
    if (specialtyController.text.isEmpty) {
      specialtyError = "Speciality shouldn't be empty";
      isValid = false;
    } else {
      specialtyError = null;
    }

    if (!isValid) {
      update([createAccountNameId]);
    }
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

    if (!isValid) {
      update([createAccountNameId]);
    }
    return isValid;

  }
  bool validateCreateAccountPhoneNumber() {
    var isValid = true;
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      phoneNumberError = null;
    }

    if (!isValid) {
      update([createAccountPhoneNumberId]);
    }
    return isValid;
  }


  bool validateCreateAccountPassword() {
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
      if(passwordController.text!=confirmPasswordController.text){
        confirmPasswordError = "Password doesn't match";
        isValid = false;
      }else{
        confirmPasswordError=null;
      }
    if (!isValid) {
      update([createAccountPasswordId]);
    }
    return isValid;
  }
  bool validateResetPhoneNumber() {
    var isValid = true;
    if (phoneResetPasswordController.text.isEmpty) {
      phoneResetError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      phoneResetError = null;
    }

    if (!isValid) {
      update([resetPasswordPasswordId]);
    }
    return isValid;
  }
  bool validateResetPassword() {
    var isValid = true;
    if (passwordResetPasswordController.text.isEmpty) {
      passwordResetError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      passwordResetError = null;
    }
    if (confirmResetPasswordController.text.isEmpty) {
      confirmResetError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      confirmResetError = null;
    }
    if (passwordResetPasswordController.text==confirmResetPasswordController.text) {
      confirmResetError = "Password doesn't match";
      isValid = false;
    } else {
      confirmResetError = null;
    }

    if (!isValid) {
      update([resetPasswordPhoneId]);
    }
    return isValid;
  }
  bool validateResetVerify() {
    var isValid = true;
    if (verifyResetPasswordController.text.isEmpty) {
      verifyResetError = "Phone number shouldn't be empty";
      isValid = false;
    } else {
      verifyResetError = null;
    }

    if (!isValid) {
      update([resetPasswordverifyId]);
    }
    return isValid;
  }



  void updateCreateAccountState(CreateAccountState state) {
    createAccountState = state;
    update([createAccountNameId]);
  }
}

enum CreateAccountState { initial, loading, loaded, error }
