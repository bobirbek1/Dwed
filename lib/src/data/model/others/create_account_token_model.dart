import 'package:equatable/equatable.dart';

class CreateAccountModel extends Equatable {
  @override
  List<Object?> get props => [
        username,
        name,
        surname,
        lastname,
        email,
        avatar,
        phone,
        birthday,
        gender,
        mainCat,
        region,
        bio,
        userLang,
        currency,
        status,
        hasUsablePassword,
        qrCode,
        isRelated,
      ];
  String? username;
  String? name;
  String? surname;
  String? lastname;
  String? email;
  String? avatar;
  String? phone;
  String? birthday;
  String? gender;
  MainCat? mainCat;
  Region? region;
  String? bio;
  String? userLang;
  Currency? currency;
  int? status;
  bool? hasUsablePassword;
  String? qrCode;
  bool? isRelated;

  CreateAccountModel({
    this.username,
    this.name,
    this.surname,
    this.lastname,
    this.email,
    this.avatar,
    this.phone,
    this.birthday,
    this.gender,
    this.mainCat,
    this.region,
    this.bio,
    this.userLang,
    this.currency,
    this.status,
    this.hasUsablePassword,
    this.qrCode,
    this.isRelated,
  });

  CreateAccountModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    surname = json['surname'];
    lastname = json['lastname'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    mainCat =
        json['main_cat'] != null ? MainCat.fromJson(json['main_cat']) : null;
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    bio = json['bio'];
    userLang = json['user_lang'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    status = json['status'];
    hasUsablePassword = json['has_usable_password'];
    qrCode = json['qr_code'];
    isRelated = json['is_related'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    data['surname'] = surname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['gender'] = gender;
    if (mainCat != null) {
      data['main_cat'] = mainCat!.toJson();
    }
    if (region != null) {
      data['region'] = region!.toJson();
    }
    data['bio'] = bio;
    data['user_lang'] = userLang;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['status'] = status;
    data['has_usable_password'] = hasUsablePassword;
    data['qr_code'] = qrCode;
    data['is_related'] = isRelated;
    return data;
  }
}

class MainCat {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;
  bool? hasSubs;

  MainCat(
      {this.id,
      this.slug,
      this.name,
      this.description,
      this.image,
      this.hasSubs});

  MainCat.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
