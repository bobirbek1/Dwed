import 'package:get/get.dart';

import '../../../domain/usecase/quiz/get/abstract/active_sessions_usecase.dart';

class SessionsController extends GetxController {
  ///use cases
  final ActiveSessionsUseCase activeSessionsUseCase; //list of active sessions

  SessionsController({required this.activeSessionsUseCase});

  void loadActiveSessions() {

  }
}