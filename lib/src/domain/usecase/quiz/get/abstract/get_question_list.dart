import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

import '../../../../../data/model/quiz/new/question_list_model.dart';

abstract class GetQuestionListUseCase {
  Future<Either<Failure, List<QuestionListModel>>> getQuestionList( int quizId, int offset);
}