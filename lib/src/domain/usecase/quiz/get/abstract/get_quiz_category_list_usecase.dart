import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_model.dart';

import '../../../../../data/model/quiz/new/user_quizzes_model.dart';
import '../../../../../data/model/quiz/quiz_category.dart';

abstract class GetUserQuizzesUseCase {
  Future<Either<Failure, List<UserQuizzesModel>>> call(int offset);
}