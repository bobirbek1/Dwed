import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';

abstract class ShowUserQuizUseCase {
  ///show user quiz
  Future<Either<Failure, QuizCategoryModel>> call(int id);
}