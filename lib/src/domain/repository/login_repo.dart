import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/details_model_for_products_page.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/data/model/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
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
    String password, String? birthday, String gender, int? liveAddress, int? specialty,
  );
  Future<Either<Failure, SpecialityModel>> specialty(String sectorName);
  Future<Either<Failure, RegionModel>> region(int countryId);

  Future<Either<Failure, Map<String, dynamic>>> organisation(int offset);
  Future<Either<Failure, Map<String, dynamic>>> organisationSub(int offset, String category);
  Future<Either<Failure, List<OrganisationDetailsModel>>> organisationDetails( String slugName, int offset);
  Future<Either<Failure, OrganisationModel>> organisationUserPage(String slugName);

  Future<Either<Failure, DetailsModelForProductsPage>> getProductPageItem(String type, int id);

  Future<Either<Failure, Map<String , dynamic>>> offers(int offset);
  Future<Either<Failure, Map<String , dynamic>>> offersChild(int id, int offset);
  Future<Either<Failure, Map<String , dynamic>>> offersDetails(int id, int offset);
  Future<Either<Failure, CountryModel>> country();
  Future<Either<Failure, SectorModel>> sector();
}
