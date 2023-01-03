import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';

abstract class GetAvailableQuizCatUseCase {
  Future<Either<Failure, List<UserCreatedQuizCategoryModel>>> call (int offset, String query);
}