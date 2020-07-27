import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model2.dart';
import 'data.dart';


class AnswersApiProvider {
  Client client = Client();
  final _apiKey = '65731ceac9e6e99495f0f0ac4bafcdf7';

  Future<ItemsList> fetchAnswersList([int carouselid]) async {
    print("entered");
    
    //final response = await client
    //    .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

    //final response = await client
    //    .get("http://getquestions?api_key=$_apiKey");
    //print(response.body.toString());
    //String response='''
//[{"question":"data","answer":"johan cruyff"},{"question":"data","answer":"johan cruyff2"}]''';
//String response='{"question":"data","answer":"johan cruyff"}';

//print (json.decode(response));



    return ItemsList.fromJson(json.decode(response),carouselid);

    /*
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
      
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    */

  }
}