import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_created_quiz_category.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/get_available_quiz_categories.dart';

import '../../../repository/quiz/get_quiz_rep.dart';

class GetAvailableQuizCatUseCaseImpl extends GetAvailableQuizCatUseCase {
  final GetQuizRep getQuizRep;

  GetAvailableQuizCatUseCaseImpl({required this.getQuizRep});
  @override
  Future<Either<Failure, List<UserCreatedQuizCategoryModel>>> call(int offset, String query) async {
    return await getQuizRep.getAvailableCategories(offset, query);
  }

}