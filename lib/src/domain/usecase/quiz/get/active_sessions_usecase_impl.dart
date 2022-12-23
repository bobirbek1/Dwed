import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/session_data_model.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/active_sessions_usecase.dart';

import '../../../repository/quiz/get_quiz_rep.dart';

class ActiveSessionsUseCaseImpl extends ActiveSessionsUseCase {
  final GetQuizRep getQuizRep;

  ActiveSessionsUseCaseImpl({required this.getQuizRep});

  @override
  Future<Either<Failure, List<SessionDataModel>>> getActiveSessions(int offset) {
    return getQuizRep.getActiveSession(offset);
  }

}