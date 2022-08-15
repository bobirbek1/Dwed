import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];

  CountryModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
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

class Results {
  int? id;
  String? name;
  String? regCode;
  String? parent;
  bool? hasSubs;

  Results({this.id, this.name, this.regCode, this.parent, this.hasSubs});

  Results.fromJson(Map<String, dynamic> json) {
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
