import 'package:flutter/material.dart';
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

  // states
  LoginState loginState = LoginState.initial;

  // text field errors
  String? userNameError;
  String? passwordError;

  // data
  bool rememberMe = false;

  // ids
  final String loginId = "login_id";
  final String checkBoxId = "check_box_id";

  void signIn() async {
    if (validateLogin()) {
      updateLoginState(LoginState.loading);
      final result = await login.call(
        LoginParams(
            username: userNameController.text,
            password: passwordController.text,
            rememberMe: rememberMe,),
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
      });
    }
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
