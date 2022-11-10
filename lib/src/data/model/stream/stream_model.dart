// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class StreamModel extends Equatable {
  String? channelName;
  String? channelSlug;
  Category? category;
  String? liveAt;
  String? thumbnail;
  String? logo;
  int? liveWatchers;
  dynamic liveSchedule;
  String? next;

  StreamModel(
      {this.channelName,
      this.channelSlug,
      this.category,
      this.liveAt,
      this.thumbnail,
      this.logo,
      this.liveWatchers,
      this.liveSchedule,
      this.next});

  StreamModel.fromJson(Map<String, dynamic> json) {
    channelName = json['channel_name'];
    channelSlug = json['channel_slug'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    liveAt = json['live_at'];
    thumbnail = json['thumbnail'];
    logo = json['logo'];
    liveWatchers = json['live_watchers'];
    liveSchedule = json['live_schedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channel_name'] = channelName;
    data['channel_slug'] = channelSlug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['live_at'] = liveAt;
    data['thumbnail'] = thumbnail;
    data['logo'] = logo;
    data['live_watchers'] = liveWatchers;
    data['live_schedule'] = liveSchedule;
    return data;
  }

  @override
  List<Object?> get props => [
        channelName,
        channelSlug,
        category,
        liveAt,
        thumbnail,
        logo,
        liveWatchers,
        liveSchedule,
        next,
      ];
}

class Category extends Equatable {
  int? id;
  String? name;
  bool? hasSubs;

  Category({this.id, this.name, this.hasSubs});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['has_subs'] = hasSubs;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        hasSubs,
      ];
}
