class OffersDetailsModel {
  int? id;
  Org? org;
  String? user;
  String? name;
  int? cost;
  int? discount;
  int? qty;
  int? measurement;
  String? image;
  Category? category;
  bool? isInCart;
  String? ikpu;
  int? vat;

  OffersDetailsModel(
      {this.id,
        this.org,
        this.user,
        this.name,
        this.cost,
        this.discount,
        this.qty,
        this.measurement,
        this.image,
        this.category,
        this.isInCart,
        this.ikpu,
        this.vat});

  OffersDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    org = json['org'] != null ?  Org.fromJson(json['org']) : null;
    user = json['user'];
    name = json['name'];
    cost = json['cost'];
    discount = json['discount'];
    qty = json['qty'];
    measurement = json['measurement'];
    image = json['image'];
    category = json['category'] != null
        ?  Category.fromJson(json['category'])
        : null;
    isInCart = json['is_in_cart'];
    ikpu = json['ikpu'];
    vat = json['vat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (org != null) {
      data['org'] = org!.toJson();
    }
    data['user'] = user;
    data['name'] = name;
    data['cost'] = cost;
    data['discount'] = discount;
    data['qty'] = qty;
    data['measurement'] = measurement;
    data['image'] = image;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['is_in_cart'] = isInCart;
    data['ikpu'] = ikpu;
    data['vat'] = vat;
    return data;
  }
}

class Org {
  String? name;
  String? slugName;
  String? logo;
  String? background;
  bool? isOfficial;
  Rating? rating;

  Org(
      {this.name,
        this.slugName,
        this.logo,
        this.background,
        this.isOfficial,
        this.rating});

  Org.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slugName = json['slug_name'];
    logo = json['logo'];
    background = json['background'];
    isOfficial = json['is_official'];
    rating =
    json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['slug_name'] = slugName;
    data['logo'] = logo;
    data['background'] = background;
    data['is_official'] = isOfficial;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
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
  int? score;

  Professional({this.level, this.remainingScore, this.score});

  Professional.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    remainingScore = json['remaining_score'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['level'] = level;
    data['remaining_score'] = remainingScore;
    data['score'] = score;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  Parent? parent;
  String? image;
  bool? hasSubs;

  Category(
      {this.id,
        this.name,
        this.description,
        this.parent,
        this.image,
        this.hasSubs});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parent =
    json['parent'] != null ?  Parent.fromJson(json['parent']) : null;
    image = json['image'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['parent_id'] = parentId;
    data['image'] = image;
    return data;
  }
}
