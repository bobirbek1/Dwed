import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/get_quiz_category_list_usecase.dart';

class GetUserQuizzesUseCaseImpl extends GetUserQuizzesUseCase {
  final GetQuizRep getQuizRep;

  GetUserQuizzesUseCaseImpl({required this.getQuizRep});

  @override
  Future<Either<Failure, List<UserCreatedQuizModel>>> call(int offset) {
    return getQuizRep.getUserQuizzes(offset);
  }
}