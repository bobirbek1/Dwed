import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/data/model/token_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, TokenModel>> login(
      String username, String password, bool rememberMe);
  Future<Either<Failure, bool>> sendPhone(
      String phoneNumber);
  Future<Either<Failure, bool>> smsCode(
      String smsCode);
  Future<Either<Failure, bool>> reset(
      String newPassword, String confirmPassword,);
  Future<Either<Failure, CreateAccountModel>> createAccount(
    String username,
    String name,
    String? surname,
    String phone,
    String password,
  );
  Future<Either<Failure, SpecialityModel>> specialty(String sectorName);
  Future<Either<Failure, RegionModel>> region(int countryId);
  Future<Either<Failure, CountryModel>> country();
  Future<Either<Failure, SectorModel>> sector();
}
