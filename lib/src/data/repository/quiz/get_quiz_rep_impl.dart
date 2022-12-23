import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/quiz/remote/quiz_remote_data_source.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_question_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_data_model.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:get/get_core/src/get_main.dart';

class GetQuizRepImpl extends GetQuizRep {
  final QuizRemoteDataSource quizRemoteDataSource;
  final NetworkInfo networkInfo;

  GetQuizRepImpl(
      {required this.quizRemoteDataSource, required this.networkInfo});

  ///list or user quizzes
  @override
  Future<Either<Failure, List<UserCreatedQuizModel>>> getUserQuizzes(
      int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("GET_QUIZ_REP getUserQuizzes NET CONNECTED");
      try {
        final res = await quizRemoteDataSource.getUserQuizzes(offset);
        Get.log("GET_QUIZ_REP getUserQuizzes DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log("GET_QUIZ_REP getUserQuizzes FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getUserQuizzes FAILURE => NetworkFailure");
      return const Left(NetworkFailure());
    }
  }

  ///show user quiz
  @override
  Future<Either<Failure, QuizCategoryModel>> getUserQuiz(int id) async {
    if (await networkInfo.isConnected) {
      Get.log("GET_QUIZ_REP getUserQuiz NET CONNECTED");
      try {
        final res = await quizRemoteDataSource.getUserQuiz(id);
        Get.log("GET_QUIZ_REP getUserQuiz DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log("GET_QUIZ_REP getUserQuiz FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getUserQuiz FAILURE => NetworkFailure");
      return const Left(NetworkFailure());
    }
  }

  ///question list for quiz
  @override
  Future<Either<Failure, List<QuizQuestionModel>>> getQuestionList(
      int quizId, int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("GET_QUIZ_REP getQuestionList NET CONNECTED");
      try {
        final res = await quizRemoteDataSource.getQuestionList(quizId, offset);
        Get.log("GET_QUIZ_REP getQuestionList DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log("GET_QUIZ_REP getQuestionList FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getQuestionList FAILURE => NetworkFailure");
      return const Left(NetworkFailure());
    }
  }

  ///show question information
  @override
  Future<Either<Failure, QuizQuestionModel>> getQuestionInformation(
      int quizId, int id) async {
    if (await networkInfo.isConnected) {
      Get.log("GET_QUIZ_REP getQuestionInformation NET CONNECTED");
      try {
        final res =
            await quizRemoteDataSource.getQuestionInformation(quizId, id);
        Get.log('GET_QUIZ_REP getQuestionInformation DATA => $res');
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log(
            "GET_QUIZ_REP getQuestionInformation FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getQuestionInformation FAILURE => NetworkFailure");
      return const Left(NetworkFailure());
    }
  }

  ///list of active sessions
  @override
  Future<Either<Failure, List<SessionDataModel>>> getActiveSession(
      int offset) async {
    if (await networkInfo.isConnected) {
      Get.log('GET_QUIZ_REP getActiveSession NET CONNECTED');
      try {
        final res = await quizRemoteDataSource.getActiveSession(offset);
        Get.log('GET_QUIZ_REP getActiveSession DATA => $res');
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log('GET_QUIZ_REP getActiveSession FAILURE => ${failure.message}');
        return Left(failure);
      }
    } else {
      Get.log('GET_QUIZ_REP getActiveSession FAILURE => NetworkFailure');
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, SessionDetailModel>> getSessionDetail(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await quizRemoteDataSource.getSessionDetail(id);
        Get.log("GET_QUIZ_REP getSessionDetail DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log("GET_QUIZ_REP getSessionDetail FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getSessionDetail FAILURE => NetworkFailure");
      throw const NetworkFailure();
    }
  }

  ///get available categories
  @override
  Future<Either<Failure, List<UserCreatedQuizCategoryModel>>>
      getAvailableCategories(int offset, String query) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await quizRemoteDataSource.getAvailableCategories(offset, query);
        Get.log(
            "GET_QUIZ_REP getAvailableCategories DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException( e as Exception);
        Get.log("GET_QUIZ_REP getAvailableCategories FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("GET_QUIZ_REP getAvailableCategories FAILURE => NetworkFailure");
      throw const NetworkFailure();
    }
  }
}
