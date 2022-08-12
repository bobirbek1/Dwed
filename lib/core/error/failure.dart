import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({required this.message});
}

class ServerUnknownFailure extends Failure {
  const ServerUnknownFailure({String? message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class ServerTimeOutFailure extends Failure {
  const ServerTimeOutFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class ServerUnAuthorizeFailure extends Failure {
  const ServerUnAuthorizeFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class ServerNotFoundFailure extends Failure {
  const ServerNotFoundFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class ServerCancelFailure extends Failure {
  const ServerCancelFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  final dynamic data;
  const NetworkFailure({String? message, this.data}) : super(message: message);
  @override
  List<Object?> get props => [message, data];
}
