import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/offers/offer_gallery.dart';

abstract class OffersRepo {
  Future<Either<Failure, Map<String, dynamic>>> offers(int offset);
  Future<Either<Failure, Map<String, dynamic>>> offersChild(int id, int offset);
  Future<Either<Failure, Map<String, dynamic>>> offersDetails(
      int id, int offset);
  Future<Either<Failure, List<OfferGallery>>> offerGallery(
      int id);
}
