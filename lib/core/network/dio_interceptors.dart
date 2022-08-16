import 'package:dio/dio.dart';

Dio addInterceptor(Dio client) {
  return client..interceptors.add(LogInterceptor(responseBody: true,responseHeader: true,),);
}
