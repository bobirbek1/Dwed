import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}


abstract class Params extends Equatable{
  
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];
}
