import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

import '../../../../../data/model/quiz/session_data_model.dart';

abstract class ActiveSessionsUseCase {
  ///list of active sessions
  Future<Either<Failure, List<SessionDataModel>>> getActiveSessions(int offset);
}