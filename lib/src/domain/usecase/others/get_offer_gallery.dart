import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers/offer_gallery.dart';
import 'package:flutter_template/src/domain/repository/others/offers_repo.dart';

class GetOfferGallery extends Usecase<List<OfferGallery>, OfferGalleryParams> {
  final OffersRepo repo;

  GetOfferGallery({required this.repo});

  @override
  Future<Either<Failure, List<OfferGallery>>> call(OfferGalleryParams params) {
    return repo.offerGallery(params.id);
  }
}

class OfferGalleryParams extends Params {
  final int id;
  OfferGalleryParams({required this.id});

  @override
  List<Object?> get props => [id];
}
