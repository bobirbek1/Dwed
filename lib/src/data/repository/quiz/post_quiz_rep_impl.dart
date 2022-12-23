import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';
import 'package:flutter_template/src/domain/repository/quiz/post_quiz_rep.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/platform/network_info.dart';
import '../../datasource/quiz/remote/quiz_remote_data_source.dart';

class PostQuizRepImpl extends PostQuizRep {
  NetworkInfo networkInfo;
  QuizRemoteDataSource quizRemoteDataSource;

  PostQuizRepImpl({required this.networkInfo, required this.quizRemoteDataSource});

  @override
  Future<Either<Failure, UserQuizResponseModel>> createQuiz(
      UserQuizModel userQuizModel) async {
    if (await networkInfo.isConnected) {
      Get.log("POST_QUIZ_REP_IMPL createQuiz NET CONNECTED");
      try {
        final res = await quizRemoteDataSource.createQuiz(userQuizModel);
        Get.log("POST_QUIZ_REP_IMPL createQuiz DATA => $res");
        return Right(res);
      } catch (e) {
        Failure failure = handleException(e as Exception);
        Get.log("POST_QUIZ_REP_IMPL createQuiz FAILURE => ${failure.message}");
        return Left(failure);
      }
    } else {
      Get.log("POST_QUIZ_REP_IMPL createQuiz FAILURE => NetworkFailure");
      return const Left(NetworkFailure());
    }
  }
}
