import '../blocs/answers_bloc.dart';
import '../resources/answers_api_provider.dart';
import 'item_model2.dart';
import 'package:edit_distance/edit_distance.dart';

class CompareGuess
{

  Future<List<Item>> getdata (int carouselid) async
  {
     //List compare;
     int total=0;

    final apidata= new AnswersApiProvider();

    // Its been defined as a future so you need to
    // use async / await

    ItemsList compare=await apidata.fetchAnswersList(carouselid);

    List<Item> compitem = compare.Items;

   
     
  return compitem;
  }
  

  int comparison (String guess,List<Item> compitem)
  {
     //List compare;
     int total=0;
     num diff;
     String lastWord;

     //List<Item> compitem=getdata();

     Levenshtein d = new Levenshtein();

     for (var i=0; i < compitem.length; i++)
     {
       diff=d.normalizedDistance(guess, compitem[i].answer);
       print(guess);
       print(compitem[i].answer);
       print(diff);

       if ( diff < 0.5)
       //if (guess == compitem[i].answer)
       {
          total=1;
          break;
       }
       else // compare last name
       {
         try {
         lastWord = compitem[i].answer.substring(compitem[i].answer.lastIndexOf(' '));
         }
         catch (error)
         {
           print(compitem[i].answer);
           print(error);
           lastWord="";
         }
         print('Last:'+lastWord);
         diff=d.normalizedDistance(guess,lastWord);
         if ( diff < 0.5)
         {
           total=1;
           break;

         }
       }
     }
  return total;
  }
}

final guess=CompareGuess();

