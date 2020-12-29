import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model3.dart';

class AnswersBloc {
  final _repository = Repository();
  final _answersFetcher = PublishSubject<ItemsList>();

  Observable<ItemsList> get allMovies => _answersFetcher.stream;

  fetchAllAnswers() async {
    //ItemsList itemModel = await _repository.fetchAllAnswers();
    ItemsList itemModel;
    _answersFetcher.sink.add(itemModel);
  }

  dispose() {
    _answersFetcher.close();
  }
}

final bloc = AnswersBloc();
