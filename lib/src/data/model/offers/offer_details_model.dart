// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OfferDetailsModel extends Equatable {
  int? id;
  Org? org;
  dynamic user;
  String? name;
  String? description;
  int? cost;
  Currency? currency;
  int? qty;
  int? minQty;
  int? maxQty;
  int? measurement;
  Group? group;
  OfferCategory? category;
  List<Responsible>? responsible;
  dynamic barCode;
  dynamic discount;
  bool? isInCart;
  dynamic ikpu;
  int? vat;
  dynamic textCheck;

  OfferDetailsModel({
    this.id,
    this.org,
    this.user,
    this.name,
    this.description,
    this.cost,
    this.currency,
    this.qty,
    this.minQty,
    this.maxQty,
    this.measurement,
    this.group,
    this.category,
    this.responsible,
    this.barCode,
    this.discount,
    this.isInCart,
    this.ikpu,
    this.vat,
    this.textCheck,
  });

  OfferDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    org = json['org'] != null ? Org.fromJson(json['org']) : null;
    user = json['user'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    qty = json['qty'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    measurement = json['measurement'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    category = json['category'] != null
        ? OfferCategory.fromJson(json['category'])
        : null;
    if (json['responsible'] != null) {
      responsible = <Responsible>[];
      json['responsible'].forEach((v) {
        responsible!.add(Responsible.fromJson(v));
      });
    }
    barCode = json['bar_code'];
    discount = json['discount'];
    isInCart = json['is_in_cart'];
    ikpu = json['ikpu'];
    vat = json['vat'];
    textCheck = json['text_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (org != null) {
      data['org'] = org!.toJson();
    }
    data['user'] = user;
    data['name'] = name;
    data['description'] = description;
    data['cost'] = cost;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['qty'] = qty;
    data['min_qty'] = minQty;
    data['max_qty'] = maxQty;
    data['measurement'] = measurement;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (responsible != null) {
      data['responsible'] = responsible!.map((v) => v.toJson()).toList();
    }
    data['bar_code'] = barCode;
    data['discount'] = discount;
    data['is_in_cart'] = isInCart;
    data['ikpu'] = ikpu;
    data['vat'] = vat;
    data['text_check'] = textCheck;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        org,
        user,
        name,
        description,
        cost,
        currency,
        qty,
        minQty,
        maxQty,
        measurement,
        group,
        category,
        responsible,
        barCode,
        discount,
        isInCart,
        ikpu,
        vat,
        textCheck,
      ];
}

class Org extends Equatable {
  int? legalForm;
  String? name;
  String? slugName;
  OrgCategory? category;
  Subs? subs;
  String? logo;
  dynamic background;
  bool? isOfficial;
  Rating? rating;

  Org({
    this.legalForm,
    this.name,
    this.slugName,
    this.category,
    this.subs,
    this.logo,
    this.background,
    this.isOfficial,
    this.rating,
  });

  Org.fromJson(Map<String, dynamic> json) {
    legalForm = json['legal_form'];
    name = json['name'];
    slugName = json['slug_name'];
    category = json['category'] != null
        ? OrgCategory.fromJson(json['category'])
        : null;
    subs = json['subs'] != null ? Subs.fromJson(json['subs']) : null;
    logo = json['logo'];
    background = json['background'];
    isOfficial = json['is_official'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
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
    return data;
  }

  @override
  List<Object?> get props => [
        legalForm,
        name,
        slugName,
        category,
        subs,
        logo,
        background,
        isOfficial,
        rating,
      ];
}

class OrgCategory {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;
  bool? hasSubs;

  OrgCategory({id, slug, name, description, image, hasSubs});

  OrgCategory.fromJson(Map<String, dynamic> json) {
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

class Subs extends Equatable {
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

  @override
  List<Object?> get props => [me, subscribed];
}

class Rating extends Equatable {
  Professional? professional;
  Professional? ethics;
  Professional? aesthetics;

  Rating({
    this.professional,
    this.ethics,
    this.aesthetics,
  });

  Rating.fromJson(Map<String, dynamic> json) {
    professional = json['professional'] != null
        ? Professional.fromJson(json['professional'])
        : null;
    ethics =
        json['ethics'] != null ? Professional.fromJson(json['ethics']) : null;
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

  @override
  List<Object?> get props => [
        professional,
        ethics,
        aesthetics,
      ];
}

class Professional extends Equatable {
  int? level;
  int? remainingScore;
  int? score;

  Professional({
    this.level,
    this.remainingScore,
    this.score,
  });

  Professional.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    remainingScore = json['remaining_score'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['remaining_score'] = remainingScore;
    data['score'] = score;
    return data;
  }

  @override
  List<Object?> get props => [
        level,
        remainingScore,
        score,
      ];
}

class Currency extends Equatable {
  int? id;
  String? name;
  String? code;

  Currency({
    this.id,
    this.name,
    this.code,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
      ];
}

class Group extends Equatable {
  int? id;
  String? name;
  String? image;

  Group({
    this.id,
    this.name,
    this.image,
  });

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}

class OfferCategory extends Equatable {
  int? id;
  String? name;
  String? description;
  Parent? parent;
  String? image;
  bool? hasSubs;

  OfferCategory({
    this.id,
    this.name,
    this.description,
    this.parent,
    this.image,
    this.hasSubs,
  });

  OfferCategory.fromJson(Map<String, dynamic> json) {
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
  List<Object?> get props => [
        id,
        name,
        description,
        parent,
        image,
        hasSubs,
      ];
}

class Parent extends Equatable {
  int? id;
  String? name;
  dynamic description;
  int? parentId;
  dynamic image;

  Parent({
    this.id,
    this.name,
    this.description,
    this.parentId,
    this.image,
  });

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

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        parentId,
        image,
      ];
}

class Responsible extends Equatable {
  int? id;
  User? user;
  SpecCat? specCat;
  OrgCategory? job;
  bool? isWorking;
  bool? accepted;
  OperatingMode? operatingMode;
  Rating? rating;
  dynamic existPerms;
  bool? autoMode;
  bool? isCatHead;
  dynamic position;
  List<dynamic>? currentWorkplace;

  Responsible({
    this.id,
    this.user,
    this.specCat,
    this.job,
    this.isWorking,
    this.accepted,
    this.operatingMode,
    this.rating,
    this.existPerms,
    this.autoMode,
    this.isCatHead,
    this.position,
    this.currentWorkplace,
  });

  Responsible.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    specCat =
        json['spec_cat'] != null ? SpecCat.fromJson(json['spec_cat']) : null;
    job = json['job'] != null ? OrgCategory.fromJson(json['job']) : null;
    isWorking = json['is_working'];
    accepted = json['accepted'];
    operatingMode = json['operating_mode'] != null
        ? OperatingMode.fromJson(json['operating_mode'])
        : null;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    existPerms = json['exist_perms'];
    autoMode = json['auto_mode'];
    isCatHead = json['is_cat_head'];
    position = json['position'];
    if (json['current_workplace'] != null) {
      currentWorkplace = <Null>[];
      json['current_workplace'].forEach((v) {
        currentWorkplace!.add(v);
      });
    }
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
    data['accepted'] = accepted;
    if (operatingMode != null) {
      data['operating_mode'] = operatingMode!.toJson();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['exist_perms'] = existPerms;
    data['auto_mode'] = autoMode;
    data['is_cat_head'] = isCatHead;
    data['position'] = position;
    if (currentWorkplace != null) {
      data['current_workplace'] = currentWorkplace;
    }
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        user,
        specCat,
        job,
        isWorking,
        accepted,
        operatingMode,
        rating,
        existPerms,
        autoMode,
        isCatHead,
        position,
        currentWorkplace
      ];
}

class User extends Equatable {
  String? username;
  String? fullName;
  String? avatar;
  bool? isOfficial;

  User({
    this.username,
    this.fullName,
    this.avatar,
    this.isOfficial,
  });

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

  @override
  List<Object?> get props => [
        username,
        fullName,
        avatar,
        isOfficial,
      ];
}

class SpecCat extends Equatable {
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

  @override
  List<Object?> get props => [id, name];
}

class OperatingMode extends Equatable {
  Fri? fri;
  Fri? mon;
  Fri? thu;
  Fri? tue;
  Fri? wed;

  OperatingMode({
    this.fri,
    this.mon,
    this.thu,
    this.tue,
    this.wed,
  });

  OperatingMode.fromJson(Map<String, dynamic> json) {
    fri = json['fri'] != null ? Fri.fromJson(json['fri']) : null;
    mon = json['mon'] != null ? Fri.fromJson(json['mon']) : null;
    thu = json['thu'] != null ? Fri.fromJson(json['thu']) : null;
    tue = json['tue'] != null ? Fri.fromJson(json['tue']) : null;
    wed = json['wed'] != null ? Fri.fromJson(json['wed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fri != null) {
      data['fri'] = fri!.toJson();
    }
    if (mon != null) {
      data['mon'] = mon!.toJson();
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

  @override
  List<Object?> get props => [
        fri,
        mon,
        thu,
        tue,
        wed,
      ];
}

class Fri extends Equatable {
  num? to;
  num? from;
  List<Breaks>? breaks;
  bool? noBreak;
  num? procInterval;

  Fri({
    this.to,
    this.from,
    this.breaks,
    this.noBreak,
    this.procInterval,
  });

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

  @override
  List<Object?> get props => [to, from, breaks, noBreak, procInterval];
}

class Breaks extends Equatable {
  num? to;
  num? from;

  Breaks({this.to, this.from});

  Breaks.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    return data;
  }

  @override
  List<Object?> get props => [to, from];
}
