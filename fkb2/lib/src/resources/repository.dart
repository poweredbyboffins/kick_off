import 'dart:async';
import 'answers_api_provider.dart';
import '../models/item_model2.dart';

class Repository {
  final answersApiProvider = AnswersApiProvider();

  Future<ItemsList> fetchAllAnswers() => answersApiProvider.fetchAnswersList();
}