// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OffersCatModel extends Equatable {
  int? id;
  String? name;
  String? description;
  Parent? parent;
  String? image;
  bool? hasSubs;

  OffersCatModel(
      {this.id,
      this.name,
      this.description,
      this.parent,
      this.image,
      this.hasSubs});

  OffersCatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    image = json['image'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    data['image'] = image;
    data['has_subs'] = hasSubs;
    return data;
  }

  @override
  List<Object?> get props => [id, name, description, parent, image, hasSubs];
}

class Parent {
  int? id;
  String? name;
  String? description;
  int? parentId;
  String? image;

  Parent({this.id, this.name, this.description, this.parentId, this.image});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parentId = json['parent_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['parent_id'] = parentId;
    data['image'] = image;
    return data;
  }
}
