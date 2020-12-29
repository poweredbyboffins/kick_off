//import 'package:fkb2/src/resources/answers_api_provider.dart';
import 'dart:math';
import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsList {
  List<Item> items;

  String _question;
  String _answer;

  Map toJson() => {
        'answer': _answer,
        'question': _question,
      };

  ItemsList({
    this.items,
  });

  static convert(map) {
    List<Item> questions = map.toObject.Items;
    print(questions);
    return questions;
  }

  List<Item> mapToList(Map<int, DocumentSnapshot> map) {
    int it = 0;

    Item item = new Item();

    for (MapEntry<int, DocumentSnapshot> entry in map.entries) {
      int key = entry.key;
      item.key = key;
      item.question = entry.value.get("question");
      item.answer = entry.value.get("answer");
      this.items.add(item);
    }
    return items;
  }
}

class Item {
  //final String id;
  //final String title;
  int key;
  String question;
  String answer;

  Item(
      {
      //this.id,
      //this.url,
      this.key,
      this.question,
      this.answer});
}
