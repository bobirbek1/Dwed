import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/participiant_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_question_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';
import 'package:flutter_template/src/data/model/quiz/user_quiz_model.dart';

import '../../../model/quiz/new/user_quiz_response_model.dart';

abstract class QuizRemoteDataSource {

  ///GET
  ///list or user quizzes
  Future<List<UserCreatedQuizModel>> getUserQuizzes(int offset);
  ///is used for showing user quiz by it's id
  Future<QuizCategoryModel> getUserQuiz(int id);
  ///is used for getting question list for quiz by id
  Future<List<QuizQuestionModel>> getQuestionList(int quizId, int offset);
  ///is used to show question information
  Future<QuizQuestionModel> getQuestionInformation(int quizId, int id);
  ///return participant data with session result
  Future<ParticipantDataModel> getPartDataWithSession(int id);
  ///list of active sessions
  Future<List<SessionDataModel>> getActiveSession(int offset);
  ///detail information about session
  Future<SessionDetailModel> getSessionDetail(int id);
  ///list of available category
  Future<List<UserCreatedQuizCategoryModel>> getAvailableCategories(int offset, String query);

  ///POST
  ///create quiz
  Future<UserQuizResponseModel> createQuiz(UserQuizModel userQuizModel);
}