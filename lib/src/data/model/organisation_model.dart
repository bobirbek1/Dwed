import 'package:equatable/equatable.dart';

class OrganisationModel extends Equatable {
  int? legalForm;
  String? name;
  String? slugName;
  Category? category;
  Subs? subs;
  String? logo;
  String? background;
  bool? isOfficial;
  Rating? rating;

  OrganisationModel(
      {this.legalForm,
      this.name,
      this.slugName,
      this.category,
      this.subs,
      this.logo,
      this.background,
      this.isOfficial,
      this.rating});

  OrganisationModel.fromJson(Map<String, dynamic> json) {
    legalForm = json['legal_form'];
    name = json['name'];
    slugName = json['slug_name'];
    category = json['category'] != null
        ?  Category.fromJson(json['category'])
        : null;
    subs = json['subs'] != null ?  Subs.fromJson(json['subs']) : null;
    logo = json['logo'];
    background = json['background'];
    isOfficial = json['is_official'];
    rating =
        json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['legal_form'] = legalForm;
    data['name'] = name;
    data['slug_name'] = slugName;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subs != null) {
      data['subs'] = subs!.toJson();
    }
    data['logo'] = logo;
    data['background'] = background;
    data['is_official'] = isOfficial;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        legalForm,
        name,
        slugName,
        category,
        subs,
        logo,
        background,
        isOfficial,
        rating
      ];
}

class Category {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;
  bool? hasSubs;

  Category(
      {this.id,
      this.slug,
      this.name,
      this.description,
      this.image,
      this.hasSubs});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['has_subs'] = hasSubs;
    return data;
  }
}

class Subs {
  int? me;
  bool? subscribed;

  Subs({this.me, this.subscribed});

  Subs.fromJson(Map<String, dynamic> json) {
    me = json['me'];
    subscribed = json['subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['me'] = me;
    data['subscribed'] = subscribed;
    return data;
  }
}

class Rating {
  Professional? professional;
  Professional? ethics;
  Professional? aesthetics;

  Rating({this.professional, this.ethics, this.aesthetics});

  Rating.fromJson(Map<String, dynamic> json) {
    professional = json['professional'] != null
        ?  Professional.fromJson(json['professional'])
        : null;
    ethics = json['ethics'] != null
        ?  Professional.fromJson(json['ethics'])
        : null;
    aesthetics = json['aesthetics'] != null
        ?  Professional.fromJson(json['aesthetics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (professional != null) {
      data['professional'] = professional!.toJson();
    }
    if (ethics != null) {
      data['ethics'] = ethics!.toJson();
    }
    if (aesthetics != null) {
      data['aesthetics'] = aesthetics!.toJson();
    }
    return data;
  }
}

class Professional {
  int? level;
  int? remainingScore;
  double? score;

  Professional({this.level, this.remainingScore, this.score});

  Professional.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    remainingScore = json['remaining_score'];
    score = json['score'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['level'] =level;
    data['remaining_score'] =remainingScore;
    data['score'] =score;
    return data;
  }
}
