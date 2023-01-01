import 'package:dartz/dartz.dart';

import 'package:flutter_template/core/error/failure.dart';

import 'package:flutter_template/src/data/model/quiz/new/new_question_post_model.dart';

import 'package:flutter_template/src/data/model/quiz/new/new_question_post_response_model.dart';

import '../../../repository/quiz/post_quiz_rep.dart';
import 'abstract/post_add_question_usecase.dart';

class AddQuestionUseCaseImpl extends AddQuestionUseCase {
  PostQuizRep postQuizRep;

  AddQuestionUseCaseImpl({required this.postQuizRep});

  @override
  Future<Either<Failure, NewQuestionPostResModel>> addQuestion(NewQuestionModel newQuestionModel) {
    return postQuizRep.addQuestion(newQuestionModel);
  }
}