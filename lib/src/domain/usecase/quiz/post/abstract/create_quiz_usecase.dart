import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';

abstract class CreateQuizUseCase {
  ///create quiz
  Future<Either<Failure, UserQuizResponseModel>> call(UserQuizModel userQuizModel);
}