//import 'package:fkb2/src/resources/answers_api_provider.dart';
import 'dart:math';


class ItemsList {
  final List<Item> Items;

  ItemsList({
    this.Items,
});

  factory ItemsList.fromJson(List<dynamic> parsedJson,chosenid) {

    
    List<Item> Items = new List<Item>();
    //Items = parsedJson.map( (i)=>Item.fromJson(i) ).toList();
    Items = parsedJson.map( (i)=>Item.fromJson(i) ).toList();

    Items=Items.where((i)=>i.id==chosenid).toList();

    return new ItemsList(
      Items: Items
    );
  }
}

class Item{
  //final String id;
  //final String title;
  final int    id;
  final String question;
  final String answer;

  Item({
    //this.id,
    //this.url,
    this.id,
    this.question,
    this.answer
}) ;

  factory Item.fromJson(Map<String, dynamic> json){
    
    return new Item(
      id : json['id'], 
      question: json['question'].toString(),
      answer: json['answer'].toString(),
      //title: json['title'],
      //url: json['json'],
    );
    
  }

}

