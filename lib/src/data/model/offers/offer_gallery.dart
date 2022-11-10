// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OfferGallery extends Equatable {
  int? id;
  String? image;
  String? thumbnail;
  bool? main;

  OfferGallery({this.id, this.image, this.thumbnail, this.main});

  OfferGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['main'] = main;
    return data;
  }

  @override
  List<Object?> get props => [id, image, thumbnail, main];
}
