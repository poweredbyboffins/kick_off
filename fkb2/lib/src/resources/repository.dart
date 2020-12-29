import 'dart:async';
import 'answers_api_provider.dart';
import '../models/item_model3.dart';
//import 'getfirestoredata.old';
import 'getfsdata.dart';

class Repository {
  final answersApiProvider = AnswersApiProvider();
  final getfirestoredata = new GetFirestoreData();

  //Future<ItemsList> fetchAllAnswers() => answersApiProvider.fetchAnswersList();
  //print("Gettting data");

  //Future<ItemsList> fetchAllAnswers() => getfirestoredata.getdata();

  Future<List> fetchAllAnswers() => getfirestoredata.getdata();
}
