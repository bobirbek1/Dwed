import 'package:flutter_template/src/domain/usecase/create_account.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  //usecases
  final CreateAccount createAccount;

  CreateAccountController({required this.createAccount});

  //ids
  final String create_account_id = 'create_account_id';
}
