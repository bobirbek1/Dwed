import 'package:equatable/equatable.dart';

class RegionModel extends Equatable {
  int? count;
  String? next;
  String? previous;
  List<Region>? results;

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];

  RegionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  RegionModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Region>[];
      json['results'].forEach((v) {
        results!.add(Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? regCode;
  int? parent;
  bool? hasSubs;

  Region({this.id, this.name, this.regCode, this.parent, this.hasSubs});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regCode = json['reg_code'];
    parent = json['parent'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['reg_code'] = regCode;
    data['parent'] = parent;
    data['has_subs'] = hasSubs;
    return data;
  }
}
