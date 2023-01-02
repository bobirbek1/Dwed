import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';
import 'package:flutter_template/src/domain/usecase/quiz/post/abstract/create_quiz_usecase.dart';

import '../../../repository/quiz/post_quiz_rep.dart';

class CreateQuizUseCaseImpl extends CreateQuizUseCase{
  PostQuizRep postQuizRep;
  CreateQuizUseCaseImpl({required this.postQuizRep});

  @override
  Future<Either<Failure, UserQuizResponseModel>> call(UserQuizModel userQuizModel) {
    return postQuizRep.createQuiz(userQuizModel);
  }
}