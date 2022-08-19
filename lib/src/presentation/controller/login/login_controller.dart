import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/domain/usecase/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // usecases
  final Login login;

  LoginController({required this.login});

  // text controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final resetpasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final smsCodeResetController = TextEditingController();

  // states
  LoginState loginState = LoginState.initial;
  LoginState resetPasswordState = LoginState.initial;
  LoginState resetPhoneState = LoginState.initial;
  LoginState smsCodeState = LoginState.initial;

  // text field errors
  String? userNameError;
  String? passwordError;
  String? resetpasswordError;
  String? confirmPasswordError;
  String? phoneNumberError;
  String? smsCodeError;

  // data
  bool rememberMe = false;

  // ids
  final String loginId = "login_id";
  final String checkBoxId = "check_box_id";
  final String resetPasswordId = "create_account_password_id";
  final String phoneNumberId = "create_account_phone_number_id";
  final String smsCodeId = "create_account_phone_number_id";

  void signIn() async {
    if (validateLogin()) {
      updateLoginState(LoginState.loading);
      final result = await login.call(
        LoginParams(
          username: userNameController.text,
          password: passwordController.text,
          rememberMe: rememberMe,
        ),
      );
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log("Internet connection is failed! Please try again");
        } else if (failure is ServerTimeOutFailure) {
          Get.log("Please check your network connection!");
        } else {
          userNameError = "username or password is not correct!";
          passwordError = "username or password is not correct!";
        }
        updateLoginState(LoginState.error);
      }, (res) {
        updateLoginState(LoginState.loaded);
        Get.toNamed(AppRoutes.LOGIN);
      });
    }
  }

  void resetPassword() async {
    if (validatePassword()) {
      updateResetPasswordState(LoginState.loading);
      final result = await login.resetCall(ResetParams(
        newPassword: resetpasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ));
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log("Internet connection is failed! Please try again");
        } else if (failure is ServerTimeOutFailure) {
          Get.log("Please check your network connection!");
        } else {
          resetpasswordError = "username or password is not correct!";
          confirmPasswordError = "username or password is not correct!";
        }
        updateResetPasswordState(LoginState.error);
      }, (res) {
        updateResetPasswordState(LoginState.loaded);
      });
    }
  }

  void sendPhoneReset() async {
    if (validateSendPhone()) {
      updateSendPhoneState(LoginState.loading);
      final result = await login.resetCall(ResetParams(
        newPassword: resetpasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ));
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log("Internet connection is failed! Please try again");
        } else if (failure is ServerTimeOutFailure) {
          Get.log("Please check your network connection!");
        } else {
          phoneNumberError = "username or password is not correct!";
        }
        updateSendPhoneState(LoginState.error);
      }, (res) {
        updateSendPhoneState(LoginState.loaded);
      });
    }
  }

  void smsCodeReset() async {
    if (validateSendPhone()) {
      updateSmsCodeState(LoginState.loading);
      final result = await login.resetCall(ResetParams(
        newPassword: resetpasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ));
      result.fold((failure) {
        if (failure is NetworkFailure) {
          Get.log("Internet connection is failed! Please try again");
        } else if (failure is ServerTimeOutFailure) {
          Get.log("Please check your network connection!");
        } else {
          smsCodeError = "username or password is not correct!";
        }
        updateSmsCodeState(LoginState.error);
      }, (res) {
        updateSmsCodeState(LoginState.loaded);
      });
    }
  }

  bool validateSmsCode() {
    var isValid = true;
    if (smsCodeResetController.text.isEmpty) {
      smsCodeError = "Password shouldn't be empty";
      isValid = false;
    } else {
      smsCodeError = null;
    }

    update([smsCodeId]);
    return isValid;
  }

  bool validateSendPhone() {
    var isValid = true;
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError = "Password shouldn't be empty";
      isValid = false;
    } else {
      phoneNumberError = null;
    }

    update([phoneNumberId]);
    return isValid;
  }

  bool validatePassword() {
    var isValid = true;
    if (resetpasswordController.text.isEmpty) {
      resetpasswordError = "Password shouldn't be empty";
      isValid = false;
    } else {
      resetpasswordError = null;
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
    update([resetPasswordId]);
    return isValid;
  }

  bool validateLogin() {
    var isValid = true;
    if (userNameController.text.isEmpty) {
      userNameError = "Username shouldn't be empty";
      isValid = false;
    } else {
      userNameError = null;
    }
    if (passwordController.text.isEmpty) {
      passwordError = "Password shouldn't be empty";
      isValid = false;
    } else {
      passwordError = null;
    }
    if (!isValid) {
      update([loginId]);
    }
    return isValid;
  }

  void updateLoginState(LoginState state) {
    loginState = state;
    update([loginId]);
  }

  void updateResetPasswordState(LoginState state) {
    resetPasswordState = state;
    update([resetPasswordId]);
  }

  void updateSendPhoneState(LoginState state) {
    resetPhoneState = state;
    update([resetPasswordId]);
  }

  void updateSmsCodeState(LoginState state) {
    resetPhoneState = state;
    update([resetPasswordId]);
  }

  void toggleCheckBox() {
    rememberMe = !rememberMe;
    update([checkBoxId]);
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

enum LoginState { initial, loading, loaded, error }
