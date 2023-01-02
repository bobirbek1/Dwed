import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/datasource/quiz/remote/quiz_remote_data_source.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_question_post_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_question_post_response_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_session_response.dart';
import 'package:flutter_template/src/data/model/quiz/new/start_session_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quizzes_model.dart';
import 'package:flutter_template/src/data/model/quiz/participiant_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_question_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/session_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../model/quiz/new/question_list_model.dart';

class QuizRemoteDataSourceImpl extends QuizRemoteDataSource {
  final Dio client;

  QuizRemoteDataSourceImpl({required this.client});

  ///GET
  ///list or user quizzes
  @override
  Future<List<UserQuizzesModel>> getUserQuizzes(int offset) async {
    final Map<String, dynamic> map = {'offset': offset, 'limit': 10};
    try {
      final res =
          await client.get('/QMS/api/v1.0/public/quiz/', queryParameters: map);
      if (res.data != null) {
        Get.log('Category data in data source => ${res.data['results']}');
        final resList = res.data['results'];
        Get.log('Category data in data source  resList => $resList');
        List<UserQuizzesModel> list = resList.map<UserQuizzesModel>((e) {
          return UserQuizzesModel.fromJson(e);
        }).toList();
        if (list.isNotEmpty) {
          list[0].nextOffset = res.data['next_offset'];
        }
        Get.log('Category data in data source  list => $list');
        return list;
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getQuestionList FAILURE => ${e.message}");
        rethrow;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getQuestionList FAILURE => ServerUnknownException");
      throw ServerUnknownException();
    }
  }

  ///show user quiz
  @override
  Future<QuizCategoryModel> getUserQuiz(int id) async {
    try {
      final res = await client.get('/v1_0/public/quiz/$id/');
      if (res.data != null) {
        Get.log('QUIZ_REMOTE_DATA_SOURCE getUserQuiz DATA => ${res.data}');
        final data = QuizCategoryModel.fromJson(res.data);
        return data;
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log('QUIZ_REMOTE_DATA_SOURCE getUserQuiz FAILURE => $e');
      if (e is DioError) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE getUserQuiz FAILURE => ${e.message}");
        rethrow;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getUserQuiz FAILURE => ServerUnknownException");
      throw ServerUnknownException();
    }
  }

  ///question list for quiz
  @override
  Future<List<QuestionListModel>> getQuestionList(
      int quizId, int offset) async {
    try {
      final res = await client.get('/QMS/api/v1.0/public/quiz/$quizId/question/?limit=10&offset=$offset');
      if (res.data != null) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE getQuestionList DATA => ${res.data}");
        List<dynamic> results = res.data['results'];
        if(results.isEmpty) {
          return <QuestionListModel>[];
        }
        List<QuestionListModel> list = results.map((e) {
          return QuestionListModel.fromJson(e);
        }).toList();
        if (list.isNotEmpty) {
          list[0].offset = res.data['next_offset'] ?? offset;
        }
        return list;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getQuestionList FAILURE => data == null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getQuestionList FAILURE => ${e.message}");
        rethrow;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getQuestionList FAILURE => ServerUnknownException");
      throw ServerUnknownException();
    }
  }

  ///show question information
  @override
  Future<QuizQuestionModel> getQuestionInformation(int quizId, int id) async {
    try {
      final res = await client.get('/v1_0/public/quiz/$quizId/question/$id/');
      if (res.data != null) {
        Get.log(
            'QUIZ_REMOTE_DATA_SOURCE getQuestionInformation DATA => ${res.data}');
        return QuizQuestionModel.fromJson(res.data);
      }
      Get.log(
          'QUIZ_REMOTE_DATA_SOURCE getQuestionInformation FAILURE => ServerUnknownException');
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            'QUIZ_REMOTE_DATA_SOURCE getQuestionInformation FAILURE => ${e.message}');
        rethrow;
      }
      Get.log(
          'QUIZ_REMOTE_DATA_SOURCE getQuestionInformation FAILURE => ServerUnknownException');
      throw ServerUnknownException();
    }
  }

  ///return participant data with session result
  @override
  Future<ParticipantDataModel> getPartDataWithSession(int id) async {
    try {
      final res = await client.get('/v1_0/public/session/$id/show_my_result/');
      if (res.data != null) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getPartDataWitSession DATA => ${res.data}");
        return res.data;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getPartDataWitSession FAILURE => res.data == Null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getPartDataWitSession FAILURE => ${e.message}");
        rethrow;
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getPartDataWitSession FAILURE => ServerUnknownException");
      throw ServerUnknownException();
    }
  }

  ///list of active sessions
  @override
  Future<List<SessionDataModel>> getActiveSession(int offset) async {
    try {
      Map<String, dynamic> queryParams = {'limit': 15, 'offset': offset, 'history' : true, 'i_org': true};
      final res = await client.get('/QMS/api/v1.0/public/session/',
          queryParameters: queryParams);
      Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSession DATA -=> ${res.data}");
      if (res.data != null) {
        final results = res.data['results'];
        Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSession DATA => ${res.data}");
       List<SessionDataModel>  list =  results.map<SessionDataModel>((e) {
          Get.log("QUIZ_REMOTE_DATA_SOURCE SessionDataModel DATA => ${SessionDataModel.fromJson(e)}");
          return SessionDataModel.fromJson(e) ;
        }).toList();
       if(list.isNotEmpty) {
         list[0].offset = res.data['next_offset'];
       }
       return list;
      }

      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getActiveSession FAILURE => res.data == Null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getActiveSession FAILURE => ${e.message}");
        rethrow;
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSession FAILURE => $e");
      throw ServerUnknownException();
    }
  }

  ///list of active sessions
  @override
  Future<List<SessionDataModel>> getActiveSessionByCat(int offset, int cat) async  {
    try {
      Map<String, dynamic> queryParams = {'limit': 15, 'offset': offset, '  category' : cat};
      final res = await client.get('/QMS/api/v1.0/public/session/',
          queryParameters: queryParams);
      Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSessionByCat DATA -=> ${res.data}");
      if (res.data != null) {
        final results = res.data['results'];
        Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSessionByCat DATA => ${res.data}");
        List<SessionDataModel>  list =  results.map<SessionDataModel>((e) {
          Get.log("QUIZ_REMOTE_DATA_SOURCE SessionDataModel DATA => ${SessionDataModel.fromJson(e)}");
          return SessionDataModel.fromJson(e) ;
        }).toList();
        if(list.isNotEmpty) {
          list[0].offset = res.data['next_offset'];
        }
        return list;
      }

      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getActiveSessionByCat FAILURE => res.data == Null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getActiveSessionByCat FAILURE => ${e.message}");
        rethrow;
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE getActiveSessionByCat FAILURE => $e");
      throw ServerUnknownException();
    }
  }

  ///detail information about session
  @override
  Future<SessionDetailModel> getSessionDetail(int id) async {
    try {
      final res = await client.get('/v1.0/public/session/$id/');
      Get.log("QUIZ_REMOTE_DATA_SOURCE getSessionDetail DATA => ${res.data}");
      if (res.data != null) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE getSessionDetail DATA => ${res.data}");
        return SessionDetailModel.fromJson(res.data);
      }
      Get.log(
          "QUIZ_REMOTE_DATA_SOURCE getSessionDetail FAILURE => res.data == Null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getSessionDetail FAILURE => ${e.message}");
        rethrow;
      }
      throw ServerUnknownException();
    }
  }

  ///list of available categories
  @override
  Future<List<UserCreatedQuizCategoryModel>> getAvailableCategories(
      int offset, String query) async {
    try {
      Map<String, dynamic> map = {};
      map.addAll({"offset": offset, "limit": 10});
      if (query.isNotEmpty) {
        map.addAll({'search': query});
      }
      final res = await client.get('/QMS/api/v1.0/public/category/',
          queryParameters: map);
      if (res.data != null) {
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getAvailableCategories DATA => ${res.data}");
        final result = res.data['results'];
        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getAvailableCategories RESULT DATA => $result");
        List<UserCreatedQuizCategoryModel> list =
            result.map<UserCreatedQuizCategoryModel>((e) {
          return UserCreatedQuizCategoryModel.fromJson(e);
        }).toList();

        if (list.isNotEmpty) {
          list[0].nextOffset =
              res.data['next_offset'] ?? (offset + list.length);
        }

        Get.log(
            "QUIZ_REMOTE_DATA_SOURCE getAvailableCategories LIST DATA => $list");
        return list;
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE getAvailableCategories DATA => NULL");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log(
            'QUIZ_REMOTE_DATA_SOURCE getAvailableCategories FAILURE => ${e.message}');
        rethrow;
      }
      throw ServerUnknownException();
    }
  }

  ///POST
  ///create quiz
  @override
  Future<UserQuizResponseModel> createQuiz(UserQuizModel userQuizModel) async {
    try {
      final data = userQuizModel.toJson();
      final res = await client.post('/QMS/api/v1.0/public/quiz/', data: data);
      if (res.data != null) {
        Get.log('QUIZ_REMOTE_DATA_SOURCE createQuiz DATA => ${res.data}');
        return UserQuizResponseModel.fromJson(res.data);
      }
      Get.log('QUIZ_REMOTE_DATA_SOURCE createQuiz DATA => res.data  == Null');
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log('QUIZ_REMOTE_DATA_SOURCE createQuiz FAILURE => ${e.message}');
        rethrow;
      }
      Get.log(
          'QUIZ_REMOTE_DATA_SOURCE createQuiz FAILURE => ServerUnknownException');
      throw ServerUnknownException();
    }
  }

  ///add question to quiz
  @override
  Future<NewQuestionPostResModel> addQuestion(
      NewQuestionModel newQuestionModel) async {
    try {
      final res = await client.post(
          '/QMS/api/v1.0/public/quiz/${newQuestionModel.addAnswers![0].id}/question/',
          data: newQuestionModel);
      Get.log("QUIZ_REMOTE_DATA_SOURCE addQuestion DATA => ${res.data}");
      if (res.data != null) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE addQuestion DATA => ${res.data}");
        return NewQuestionPostResModel.fromJson(res.data);
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE addQuestion res.data => null");
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE addQuestion FAILURE => ${e.message}");
        rethrow;
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE addQuestion FAILURE => $e");
      throw ServerUnknownException();
    }
  }

  ///start session for chosen quiz
  @override
  Future<StartSessionResponseModel> startSession(StartSessionModel sessionModel, int id) async {
    try {
      final res = await client.post("/QMS/api/v1.0/public/quiz/$id/new_session/", data: sessionModel);
      Get.log("QUIZ_REMOTE_DATA_SOURCE startSession ${res.data}");
      if(res.data != null) {
        return StartSessionResponseModel.fromJson(res.data);
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE startSession FAILURE => res.data == null");
      throw ServerUnknownException();
    }catch(e) {
      if (e is DioError) {
        Get.log("QUIZ_REMOTE_DATA_SOURCE startSession FAILURE => ${e.message}");
        rethrow;
      }
      Get.log("QUIZ_REMOTE_DATA_SOURCE startSession FAILURE => $e");
      throw ServerUnknownException();
    }
  }

}
