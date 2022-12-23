import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/others/country_model.dart';
import 'package:flutter_template/src/data/model/others/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/offers/offer_details_model.dart';
import 'package:flutter_template/src/data/model/others/region_model.dart';
import 'package:flutter_template/src/data/model/others/sector_model.dart';
import 'package:flutter_template/src/data/model/others/specialty_model.dart';
import 'package:flutter_template/src/data/model/others/token_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, TokenModel>> login(
      String username, String password, bool rememberMe);
  Future<Either<Failure, bool>> sendPhone(String phoneNumber);
  Future<Either<Failure, bool>> smsCode(String smsCode);
  Future<Either<Failure, bool>> reset(
    String newPassword,
    String confirmPassword,
  );
  Future<Either<Failure, CreateAccountModel>> createAccount(
    String username,
    String name,
    String? surname,
    String phone,
    String password,
    String? birthday,
    String gender,
    int? liveAddress,
    int? specialty,
  );
  Future<Either<Failure, SpecialityModel>> specialty(String sectorName);
  Future<Either<Failure, RegionModel>> region(int countryId);

  Future<Either<Failure, OfferDetailsModel>> getProductPageItem(
      String type, int id);

  Future<Either<Failure, CountryModel>> country();
  Future<Either<Failure, SectorModel>> sector();
}
