import 'package:flutter_template/src/domain/usecase/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // usecases
  final Login login;

  LoginController({required this.login});

  // ids
  final String login_id = "login_id";
  

}
