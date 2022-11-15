// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  User? user;
  String? text;
  String? date;
  String? next;

  MessageModel({this.user, this.text, this.date,this.next});

  MessageModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['text'] = text;
    data['date'] = date;
    return data;
  }

  @override
  List<Object?> get props => [user, text, date];
}

class User extends Equatable {
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

  @override
  List<Object?> get props => [
        username,
        fullName,
        avatar,
        isOfficial,
      ];
}
