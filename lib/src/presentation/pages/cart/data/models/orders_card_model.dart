

class OrdersCardModel {
  String? sellerType;
  Seller? seller;
  Total? total;

  OrdersCardModel({this.sellerType, this.seller, this.total});

  OrdersCardModel.fromJson(Map<String, dynamic> json) {
    sellerType = json['seller_type'];
    seller =
    json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seller_type'] = sellerType;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (total != null) {
      data['total'] = total!.toJson();
    }
    return data;
  }
}

class Seller {
  int? legalForm;
  String? name;
  String? slugName;
  Category? category;
  Subs? subs;
  String? logo;
  String? background;
  bool? isOfficial;
  Rating? rating;
  List<Specialists>? specialists;

  Seller(
      {this.legalForm,
        this.name,
        this.slugName,
        this.category,
        this.subs,
        this.logo,
        this.background,
        this.isOfficial,
        this.rating,
        this.specialists});

  Seller.fromJson(Map<String, dynamic> json) {
    legalForm = json['legal_form'];
    name = json['name'];
    slugName = json['slug_name'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    subs = json['subs'] != null ? Subs.fromJson(json['subs']) : null;
    logo = json['logo'];
    background = json['background'];
    isOfficial = json['is_official'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    if (json['specialists'] != null) {
      specialists = <Specialists>[];
      json['specialists'].forEach((v) {
        specialists!.add(Specialists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (specialists != null) {
      data['specialists'] = specialists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
        ? Professional.fromJson(json['professional'])
        : null;
    ethics = json['ethics'] != null
        ? Professional.fromJson(json['ethics'])
        : null;
    aesthetics = json['aesthetics'] != null
        ? Professional.fromJson(json['aesthetics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['remaining_score'] = remainingScore;
    data['score'] = score;
    return data;
  }
}

class Specialists {
  int? id;
  User? user;
  SpecCat? specCat;
  Category? job;
  bool? isWorking;
  OperatingMode? operatingMode;
  bool? isCatHead;
  int? position;

  Specialists(
      {this.id,
        this.user,
        this.specCat,
        this.job,
        this.isWorking,
        this.operatingMode,
        this.isCatHead,
        this.position});

  Specialists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    specCat = json['spec_cat'] != null
        ? SpecCat.fromJson(json['spec_cat'])
        : null;
    job = json['job'] != null ? Category.fromJson(json['job']) : null;
    isWorking = json['is_working'];
    operatingMode = json['operating_mode'] != null
        ? OperatingMode.fromJson(json['operating_mode'])
        : null;
    isCatHead = json['is_cat_head'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (specCat != null) {
      data['spec_cat'] = specCat!.toJson();
    }
    if (job != null) {
      data['job'] = job!.toJson();
    }
    data['is_working'] = isWorking;
    if (operatingMode != null) {
      data['operating_mode'] = operatingMode!.toJson();
    }
    data['is_cat_head'] = isCatHead;
    data['position'] = position;
    return data;
  }
}

class User {
  String? username;
  String? fullName;
  String? avatar;
  bool? isOfficial;

  User({this.username, this.fullName, this.avatar, this.isOfficial});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullName = json['full_name'];
    avatar = json['avatar'];
    isOfficial = json['is_official'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['full_name'] = fullName;
    data['avatar'] = avatar;
    data['is_official'] = isOfficial;
    return data;
  }
}

class SpecCat {
  int? id;
  String? name;

  SpecCat({this.id, this.name});

  SpecCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class OperatingMode {
  Fri? fri;
  Fri? mon;
  Fri? sat;
  Fri? thu;
  Fri? tue;
  Fri? wed;

  OperatingMode({this.fri, this.mon, this.sat, this.thu, this.tue, this.wed});

  OperatingMode.fromJson(Map<String, dynamic> json) {
    fri = json['fri'] != null ? Fri.fromJson(json['fri']) : null;
    mon = json['mon'] != null ?  Fri.fromJson(json['mon']) : null;
    sat = json['sat'] != null ?  Fri.fromJson(json['sat']) : null;
    thu = json['thu'] != null ?  Fri.fromJson(json['thu']) : null;
    tue = json['tue'] != null ?  Fri.fromJson(json['tue']) : null;
    wed = json['wed'] != null ?  Fri.fromJson(json['wed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fri != null) {
      data['fri'] = fri!.toJson();
    }
    if (mon != null) {
      data['mon'] = mon!.toJson();
    }
    if (sat != null) {
      data['sat'] = sat!.toJson();
    }
    if (thu != null) {
      data['thu'] = thu!.toJson();
    }
    if (tue != null) {
      data['tue'] = tue!.toJson();
    }
    if (wed != null) {
      data['wed'] = wed!.toJson();
    }
    return data;
  }
}

class Fri {
  int? to;
  int? from;
  List<Breaks>? breaks;
  bool? noBreak;
  int? procInterval;

  Fri({this.to, this.from, this.breaks, this.noBreak, this.procInterval});

  Fri.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
    if (json['breaks'] != null) {
      breaks = <Breaks>[];
      json['breaks'].forEach((v) {
        breaks!.add(Breaks.fromJson(v));
      });
    }
    noBreak = json['no_break'];
    procInterval = json['proc_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    if (breaks != null) {
      data['breaks'] = breaks!.map((v) => v.toJson()).toList();
    }
    data['no_break'] = noBreak;
    data['proc_interval'] = procInterval;
    return data;
  }
}

class Breaks {
  num? to;
  num? from;

  Breaks({this.to, this.from});

  Breaks.fromJson(Map<String, dynamic> json) {
    to = json['to'].toDouble();
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    return data;
  }
}

class Total {
  num? cost;
  int? count;

  Total({this.cost, this.count});

  Total.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['count'] = count;
    return data;
  }
}
