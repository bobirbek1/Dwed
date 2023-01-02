import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/session_detail_usecase.dart';

class SessionDetailUseCaseImpl extends SessionDetailUseCase {
  final GetQuizRep getQuizRep;

  SessionDetailUseCaseImpl({required this.getQuizRep});

  @override
  Future<Either<Failure, SessionDetailModel>> getSessionDetail(int id) async {
    return await getQuizRep.getSessionDetail(id);
  }

}