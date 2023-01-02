import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/show_user_quiz_usecase.dart';

class ShowUserQuizUseCaseImpl extends ShowUserQuizUseCase {
  final GetQuizRep getQuizRep;
  ShowUserQuizUseCaseImpl({required this.getQuizRep});

  @override
  Future<Either<Failure, QuizCategoryModel>> call(int id) async {
    return await getQuizRep.getUserQuiz(id);
  }
}