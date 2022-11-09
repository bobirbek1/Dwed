class DetailsModelForProductsPage {
  int? id;
  Org? org;
  User? user;
  String? name;
  String? description;
  int? cost;
  Currency? currency;
  int? qty;
  int? minQty;
  int? maxQty;
  int? measurement;
  Group? group;
  Category? category;
  List<Responsible>? responsible;
  int? barCode;
  dynamic? discount;
  String? isInCart;
  String? ikpu;
  int? vat;
  String? textCheck;

  DetailsModelForProductsPage(
      {this.id,
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

  DetailsModelForProductsPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    org = json['org'] != null ? new Org.fromJson(json['org']) : null;
    user = json['user'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    qty = json['qty'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    measurement = json['measurement'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['responsible'] != null) {
      responsible = <Responsible>[];
      json['responsible'].forEach((v) {
        responsible!.add(new Responsible.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.org != null) {
      data['org'] = this.org!.toJson();
    }
    data['user'] = this.user;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cost'] = this.cost;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['qty'] = this.qty;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['measurement'] = this.measurement;
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.responsible != null) {
      data['responsible'] = this.responsible!.map((v) => v.toJson()).toList();
    }
    data['bar_code'] = this.barCode;
    data['discount'] = this.discount;
    data['is_in_cart'] = this.isInCart;
    data['ikpu'] = this.ikpu;
    data['vat'] = this.vat;
    data['text_check'] = this.textCheck;
    return data;
  }
}

class Org {
  int? legalForm;
  String? name;
  String? slugName;
  Category? category;
  Subs? subs;
  String? logo;
  String? background;
  bool? isOfficial;
  Rating? rating;

  Org(
      {this.legalForm,
        this.name,
        this.slugName,
        this.category,
        this.subs,
        this.logo,
        this.background,
        this.isOfficial,
        this.rating});

  Org.fromJson(Map<String, dynamic> json) {
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
  int? score;

  Professional({this.level, this.remainingScore, this.score});

  Professional.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    remainingScore = json['remaining_score'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['remaining_score'] = this.remainingScore;
    data['score'] = this.score;
    return data;
  }
}

class Currency {
  int? id;
  String? name;
  String? code;

  Currency({this.id, this.name, this.code});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Group {
  int? id;
  String? name;
  String? image;

  Group({this.id, this.name, this.image});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    return data;
  }
}

class Responsible {
  int? id;
  User? user;
  SpecCat? specCat;
  Category? job;
  bool? isWorking;
  bool? accepted;
  OperatingMode? operatingMode;
  Rating? rating;
  String? existPerms;
  bool? autoMode;
  bool? isCatHead;
  Position? position;
  List<String>? currentWorkplace;

  Responsible(
      {this.id,
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
        this.currentWorkplace});

  Responsible.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    specCat = json['spec_cat'] != null
        ? new SpecCat.fromJson(json['spec_cat'])
        : null;
    job = json['job'] != null ? new Category.fromJson(json['job']) : null;
    isWorking = json['is_working'];
    accepted = json['accepted'];
    operatingMode = json['operating_mode'] != null
        ? new OperatingMode.fromJson(json['operating_mode'])
        : null;
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    existPerms = json['exist_perms'];
    autoMode = json['auto_mode'];
    isCatHead = json['is_cat_head'];
    position = json['position'];
    if (json['current_workplace'] != null) {
      currentWorkplace = <String>[];
      json['current_workplace'].forEach((v) {
        currentWorkplace!.add(v);
      });
    }
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
    data['accepted'] = this.accepted;
    if (this.operatingMode != null) {
      data['operating_mode'] = this.operatingMode!.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['exist_perms'] = this.existPerms;
    data['auto_mode'] = this.autoMode;
    data['is_cat_head'] = this.isCatHead;
    data['position'] = this.position;
    if (this.currentWorkplace != null) {
      data['current_workplace'] =
          this.currentWorkplace!.map((v) => v).toList();
    }
    return data;
  }
}

class Position{
  int? id;
  String? name;
  bool? status;

  Position({this.id,required this.name, this.status});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
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
  Fri? thu;
  Fri? tue;
  Fri? wed;

  OperatingMode({this.fri, this.mon, this.thu, this.tue, this.wed});

  OperatingMode.fromJson(Map<String, dynamic> json) {
    fri = json['fri'] != null ? new Fri.fromJson(json['fri']) : null;
    mon = json['mon'] != null ? new Fri.fromJson(json['mon']) : null;
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
  int? to;
  int? from;

  Breaks({this.to, this.from});

  Breaks.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    return data;
  }
}