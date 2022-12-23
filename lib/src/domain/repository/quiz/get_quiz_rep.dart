import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_question_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';


abstract class GetQuizRep {

  ///list or user quizzes
  Future<Either<Failure, List<UserCreatedQuizModel>>> getUserQuizzes(
      int offset);

  ///show user quiz
  Future<Either<Failure, QuizCategoryModel>> getUserQuiz(int id);

  ///question list for quiz
  Future<Either<Failure, List<QuizQuestionModel>>> getQuestionList( int quizId, int offset);

  ///show question information
  Future<Either<Failure, QuizQuestionModel>> getQuestionInformation(
      int quizId, int id);

  ///list of active session
  Future<Either<Failure, List<SessionDataModel>>> getActiveSession(int offset);

  ///detail information about session
  Future<Either<Failure, SessionDetailModel>> getSessionDetail(int id);

  ///get available categories
  Future<Either<Failure, List<UserCreatedQuizCategoryModel>>> getAvailableCategories(int offset, String query);
}
