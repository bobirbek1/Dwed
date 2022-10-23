
/*

class OrdersCardModel {
  String? sellers_type;
  String? seller;
  String? total;

  OrdersCardModel ({
   this.sellers_type,
   this.seller,
   this.total,
  });

  OrdersCardModel.fromJson(Map<String, dynamic> json) {
   sellers_type = json['sellers_type'];
   seller = json['seller'];
   total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellers_type'] = this.sellers_type;
    data['seller'] = this.seller;
    data['total'] = this.total;

    return data;
  }
}*/

class OrdersCardModel {
  String? sellerType;
  Seller? seller;
  Total? total;

  OrdersCardModel({this.sellerType, this.seller, this.total});

  OrdersCardModel.fromJson(Map<String, dynamic> json) {
    sellerType = json['seller_type'];
    seller =
    json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_type'] = this.sellerType;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    if (this.total != null) {
      data['total'] = this.total!.toJson();
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
        ? new Category.fromJson(json['category'])
        : null;
    subs = json['subs'] != null ? new Subs.fromJson(json['subs']) : null;
    logo = json['logo'];
    background = json['background'];
    isOfficial = json['is_official'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    if (json['specialists'] != null) {
      specialists = <Specialists>[];
      json['specialists'].forEach((v) {
        specialists!.add(new Specialists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legal_form'] = this.legalForm;
    data['name'] = this.name;
    data['slug_name'] = this.slugName;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subs != null) {
      data['subs'] = this.subs!.toJson();
    }
    data['logo'] = this.logo;
    data['background'] = this.background;
    data['is_official'] = this.isOfficial;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    if (this.specialists != null) {
      data['specialists'] = this.specialists!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['has_subs'] = this.hasSubs;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['me'] = this.me;
    data['subscribed'] = this.subscribed;
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
        ? new Professional.fromJson(json['professional'])
        : null;
    ethics = json['ethics'] != null
        ? new Professional.fromJson(json['ethics'])
        : null;
    aesthetics = json['aesthetics'] != null
        ? new Professional.fromJson(json['aesthetics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.professional != null) {
      data['professional'] = this.professional!.toJson();
    }
    if (this.ethics != null) {
      data['ethics'] = this.ethics!.toJson();
    }
    if (this.aesthetics != null) {
      data['aesthetics'] = this.aesthetics!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['remaining_score'] = this.remainingScore;
    data['score'] = this.score;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    specCat = json['spec_cat'] != null
        ? new SpecCat.fromJson(json['spec_cat'])
        : null;
    job = json['job'] != null ? new Category.fromJson(json['job']) : null;
    isWorking = json['is_working'];
    operatingMode = json['operating_mode'] != null
        ? new OperatingMode.fromJson(json['operating_mode'])
        : null;
    isCatHead = json['is_cat_head'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.specCat != null) {
      data['spec_cat'] = this.specCat!.toJson();
    }
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    data['is_working'] = this.isWorking;
    if (this.operatingMode != null) {
      data['operating_mode'] = this.operatingMode!.toJson();
    }
    data['is_cat_head'] = this.isCatHead;
    data['position'] = this.position;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['avatar'] = this.avatar;
    data['is_official'] = this.isOfficial;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
    fri = json['fri'] != null ? new Fri.fromJson(json['fri']) : null;
    mon = json['mon'] != null ? new Fri.fromJson(json['mon']) : null;
    sat = json['sat'] != null ? new Fri.fromJson(json['sat']) : null;
    thu = json['thu'] != null ? new Fri.fromJson(json['thu']) : null;
    tue = json['tue'] != null ? new Fri.fromJson(json['tue']) : null;
    wed = json['wed'] != null ? new Fri.fromJson(json['wed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fri != null) {
      data['fri'] = this.fri!.toJson();
    }
    if (this.mon != null) {
      data['mon'] = this.mon!.toJson();
    }
    if (this.sat != null) {
      data['sat'] = this.sat!.toJson();
    }
    if (this.thu != null) {
      data['thu'] = this.thu!.toJson();
    }
    if (this.tue != null) {
      data['tue'] = this.tue!.toJson();
    }
    if (this.wed != null) {
      data['wed'] = this.wed!.toJson();
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
        breaks!.add(new Breaks.fromJson(v));
      });
    }
    noBreak = json['no_break'];
    procInterval = json['proc_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    if (this.breaks != null) {
      data['breaks'] = this.breaks!.map((v) => v.toJson()).toList();
    }
    data['no_break'] = this.noBreak;
    data['proc_interval'] = this.procInterval;
    return data;
  }
}

class Breaks {
  double? to;
  int? from;

  Breaks({this.to, this.from});

  Breaks.fromJson(Map<String, dynamic> json) {
    to = json['to'].toDouble();
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    return data;
  }
}

class Total {
  int? cost;
  int? count;

  Total({this.cost, this.count});

  Total.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['count'] = this.count;
    return data;
  }
}
