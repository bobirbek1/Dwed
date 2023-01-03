class SpecialistItemModel {
  int? id;
  Offering? offering;
  Responsible? responsible;
  int? qty;
  int? totalCost;
  List<dynamic>? surchargeIds;

  SpecialistItemModel(
      {id,
        offering,
        responsible,
        qty,
        totalCost,
        surchargeIds});

  SpecialistItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offering = json['offering'] != null
        ?  Offering.fromJson(json['offering'])
        : null;
    responsible = json['responsible'] != null
        ?  Responsible.fromJson(json['responsible'])
        : null;
    qty = json['qty'];
    totalCost = json['total_cost'];
    if (json['surcharge_ids'] != null) {
      surchargeIds = <dynamic>[];
      json['surcharge_ids'].forEach((v) {
        surchargeIds!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (offering != null) {
      data['offering'] = offering!.toJson();
    }
    if (responsible != null) {
      data['responsible'] = responsible!.toJson();
    }
    data['qty'] = qty;
    data['total_cost'] = totalCost;
    if (surchargeIds != null) {
      data['surcharge_ids'] =
          surchargeIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offering {
  int? id;
  String? name;
  int? cost;
  dynamic discount;
  dynamic qty;
  int? maxQty;
  int? minQty;
  int? measurement;
  String? image;

  Offering(
      {id,
        name,
        cost,
        discount,
        qty,
        maxQty,
        minQty,
        measurement,
        image});

  Offering.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
    discount = json['discount'];
    qty = json['qty'];
    maxQty = json['max_qty'];
    minQty = json['min_qty'];
    measurement = json['measurement'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cost'] = cost;
    data['discount'] = discount;
    data['qty'] = qty;
    data['max_qty'] = maxQty;
    data['min_qty'] = minQty;
    data['measurement'] = measurement;
    data['image'] = image;
    return data;
  }
}

class Responsible {
  int? id;
  User? user;
  Job? job;
  OperatingMode? operatingMode;
  bool? isCatHead;
  dynamic position;

  Responsible(
      {id,
        user,
        job,
        operatingMode,
        isCatHead,
        position});

  Responsible.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    job = json['job'] != null ?  Job.fromJson(json['job']) : null;
    operatingMode = json['operating_mode'] != null
        ?  OperatingMode.fromJson(json['operating_mode'])
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
    if (job != null) {
      data['job'] = job!.toJson();
    }
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

  User({username, fullName, avatar, isOfficial});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullName = json['full_name'];
    avatar = json['avatar'];
    isOfficial = json['is_official'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['full_name'] = fullName;
    data['avatar'] = avatar;
    data['is_official'] = isOfficial;
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
      {id,
        slug,
        name,
        description,
        image,
        hasSubs});

  Job.fromJson(Map<String, dynamic> json) {
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

class OperatingMode {
  Fri? fri;
  Fri? mon;
  Fri? sat;
  Fri? thu;
  Fri? tue;
  Fri? wed;

  OperatingMode({fri, mon, sat, thu, tue, wed});

  OperatingMode.fromJson(Map<String, dynamic> json) {
    fri = json['fri'] != null ?  Fri.fromJson(json['fri']) : null;
    mon = json['mon'] != null ?  Fri.fromJson(json['mon']) : null;
    sat = json['sat'] != null ?  Fri.fromJson(json['sat']) : null;
    thu = json['thu'] != null ?  Fri.fromJson(json['thu']) : null;
    tue = json['tue'] != null ?  Fri.fromJson(json['tue']) : null;
    wed = json['wed'] != null ?  Fri.fromJson(json['wed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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

  Fri({to, from, breaks, noBreak, procInterval});

  Fri.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
    if (json['breaks'] != null) {
      breaks = <Breaks>[];
      json['breaks'].forEach((v) {
        breaks!.add( Breaks.fromJson(v));
      });
    }
    noBreak = json['no_break'];
    procInterval = json['proc_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
  double? to;
  int? from;

  Breaks({to, from});

  Breaks.fromJson(Map<String, dynamic> json) {
    to = json['to'].toDouble();
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    return data;
  }
}