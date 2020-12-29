import '../blocs/answers_bloc.dart';
import '../resources/answers_api_provider.dart';
import 'item_model3.dart';
import 'package:edit_distance/edit_distance.dart';
//import '../resources/getfirestoredata.old';
import '../resources/getfsdata.dart';
import 'dart:math';

class CompareGuess {
  List<Item> compare;

  int getrandomfactor(int id) {
    int min = 1;
    int max = 5;
    final rnd = new Random();
    final int chosenid = min + rnd.nextInt(max - min);
    return chosenid;
  }

  Future<List<Item>> getnewdata(int carouselid) async {
    List<Item> compitem = compare.where((x) => x.key == carouselid).toList();

    return compitem;
  }

  Future getdata() async {
    //List compare;
    int total = 0;

    //final apidata = new AnswersApiProvider();

    // Its been defined as a future so you need to
    // use async / await

    //ItemsList compare = await apidata.fetchAnswersList(carouselid);

    //ItemsList compare = await getfirestoredata.getdata();
    final getfirestoredata = new GetFirestoreData();

    this.compare = await getfirestoredata.getdata();

    print("LENGTH" + compare.length.toString());
  }

  int comparison(String guess, List<Item> compitem) {
    //List compare;
    int total = 0;
    num diff;
    String lastWord;

    //List<Item> compitem=getdata();

    Levenshtein d = new Levenshtein();

    if (guess == '') {
      return 0;
    }

    for (var i = 0; i < compitem.length; i++) {
      diff = d.normalizedDistance(guess, compitem[i].answer);
      print(guess);
      print(compitem[i].answer);
      print(diff);

      if (diff < 0.5)
      //if (guess == compitem[i].answer)
      {
        total = 1;
        break;
      } else // compare last name
      {
        try {
          lastWord =
              compitem[i].answer.substring(compitem[i].answer.lastIndexOf(' '));
        } catch (error) {
          print(compitem[i].answer);
          print(error);
          lastWord = "";
        }
        print('Last:' + lastWord);
        diff = d.normalizedDistance(guess, lastWord);
        if (diff < 0.5) {
          total = 1;
          break;
        }
      }
    }
    return total;
  }
}

final guess = CompareGuess();
