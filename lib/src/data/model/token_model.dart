import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  String? refresh;
  String? access;

  TokenModel({this.refresh, this.access});


  TokenModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }

  @override
  List<Object?> get props => [refresh,access];
}
