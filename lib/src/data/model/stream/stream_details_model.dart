// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class StreamDetailsModel extends Equatable {
  User? user;
  String? channelName;
  String? channelDescription;
  String? channelSlug;
  int? category;
  String? liveAt;
  String? logo;
  String? thumbnail;
  int? liveWatchers;

  StreamDetailsModel(
      {this.user,
      this.channelName,
      this.channelDescription,
      this.channelSlug,
      this.category,
      this.liveAt,
      this.logo,
      this.thumbnail,
      this.liveWatchers});

  StreamDetailsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    channelName = json['channel_name'];
    channelDescription = json['channel_description'];
    channelSlug = json['channel_slug'];
    category = json['category'];
    liveAt = json['live_at'];
    logo = json['logo'];
    thumbnail = json['thumbnail'];
    liveWatchers = json['live_watchers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['channel_name'] = channelName;
    data['channel_description'] = channelDescription;
    data['channel_slug'] = channelSlug;
    data['category'] = category;
    data['live_at'] = liveAt;
    data['logo'] = logo;
    data['thumbnail'] = thumbnail;
    data['live_watchers'] = liveWatchers;
    return data;
  }

  @override
  List<Object?> get props => [
        user,
        channelName,
        channelDescription,
        channelSlug,
        category,
        liveAt,
        logo,
        thumbnail,
        liveWatchers,
      ];
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
