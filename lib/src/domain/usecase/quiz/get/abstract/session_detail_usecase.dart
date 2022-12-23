import 'package:dartz/dartz.dart';
import 'package:flutter_template/src/data/model/quiz/session_detail_model.dart';

import '../../../../../../core/error/failure.dart';

abstract class SessionDetailUseCase {
  Future<Either<Failure, SessionDetailModel>> getSessionDetail(int id);
}