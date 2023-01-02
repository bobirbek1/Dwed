import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_question_post_model.dart';

import '../../../../../data/model/quiz/new/new_question_post_response_model.dart';

abstract class AddQuestionUseCase {
  Future<Either<Failure, NewQuestionPostResModel>> addQuestion(NewQuestionModel newQuestionModel);
}