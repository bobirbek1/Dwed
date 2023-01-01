import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/get_question_list.dart';

import '../../../../data/model/quiz/new/question_list_model.dart';

class GetQuestionListImpl extends GetQuestionListUseCase {
  GetQuizRep getQuizRep;

  GetQuestionListImpl({required this.getQuizRep});

  @override
  Future<Either<Failure, List<QuestionListModel>>> getQuestionList(int quizId, int offset) {
    return getQuizRep.getQuestionList(quizId, offset);
  }

}