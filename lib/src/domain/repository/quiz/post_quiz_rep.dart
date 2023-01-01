import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_question_post_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';

import '../../../data/model/quiz/new/new_question_post_response_model.dart';
import '../../../data/model/quiz/new/new_session_response.dart';
import '../../../data/model/quiz/new/start_session_model.dart';

abstract class PostQuizRep {

  ///create quiz
  Future<Either<Failure, UserQuizResponseModel>> createQuiz(UserQuizModel userQuizModel);

  ///add question to quiz
  Future<Either<Failure, NewQuestionPostResModel>> addQuestion(NewQuestionModel newQuestionModel);

  ///start session for chosen quiz
  Future<Either<Failure, StartSessionResponseModel>> startSession(StartSessionModel sessionModel, int id);
}