class OrganisationDetailsModel {
  int? id;
  String? name;
  String? image;
  int? cost;
  int? qty;
  int? minQty;
  int? maxQty;
  int? measurement;
  Group? group;
  List<Responsible>? responsible;
  int? barCode;
  dynamic? discount;
  bool? isInCart;
  String? ikpu;
  int? vat;
  String? textCheck;

  OrganisationDetailsModel(
      {this.id,
        this.name,
        this.image,
        this.cost,
        this.qty,
        this.minQty,
        this.maxQty,
        this.measurement,
        this.group,
        this.responsible,
        this.barCode,
        this.discount,
        this.isInCart,
        this.ikpu,
        this.vat,
        this.textCheck});

  OrganisationDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    cost = json['cost'];
    qty = json['qty'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    measurement = json['measurement'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
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
    data['name'] = this.name;
    data['image'] = this.image;
    data['cost'] = this.cost;
    data['qty'] = this.qty;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['measurement'] = this.measurement;
    if (this.group != null) {
      data['group'] = this.group!.toJson();
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

class Responsible {
  int? id;
  User? user;
  SpecCat? specCat;
  Job? job;
  bool? isWorking;
  OperatingMode? operatingMode;
  bool? isCatHead;
  dynamic? position;

  Responsible(
      {this.id,
        this.user,
        this.specCat,
        this.job,
        this.isWorking,
        this.operatingMode,
        this.isCatHead,
        this.position});

  Responsible.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    specCat = json['spec_cat'] != null
        ? new SpecCat.fromJson(json['spec_cat'])
        : null;
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
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

class Job {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;
  bool? hasSubs;

  Job(
      {this.id,
        this.slug,
        this.name,
        this.description,
        this.image,
        this.hasSubs});

  Job.fromJson(Map<String, dynamic> json) {
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