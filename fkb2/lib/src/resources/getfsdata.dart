import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../models/item_model3.dart';
//import 'package:firedart/firedart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class GetFirestoreData {
  FirebaseFirestore ref;

  GetFirestoreData() {
    this.ref = ref;
  }

  int getrandomfactor() {
    int min = 1;
    int max = 11;
    final rnd = new Random();
    final int chosenid = min + rnd.nextInt(max - min);
    return chosenid;
  }

  Future<List> getdata() async {
    String projectId = 'kickoff-e12f6';
    String apiKey = 'AIzaSyBot_ntjdO3B5gh3-ZOYEaHzROrmoIxj_U';
    String email = 'andybnsn@gmail.com';
    String password = 'Pwd123&&';

    List<Item> questions = List<Item>();

    int i = 0;

    final FirebaseOptions firebaseOptions = const FirebaseOptions(
      appId: '1:904830582297:android:a904e7039d1a470e3a7488',
      apiKey: 'AIzaSyBot_ntjdO3B5gh3-ZOYEaHzROrmoIxj_U',
      projectId: 'kickoff-e12f6',
      messagingSenderId: '',
    );
    await Firebase.initializeApp(name: 'kick_off', options: firebaseOptions);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
    } catch (e) {
      print(e.message);
    }

    /*CollectionReference firestore =
        FirebaseFirestore.instance.collection("questions");

    QuerySnapshot map = await firestore.get();
    */
    int rf = getrandomfactor();

    ref = FirebaseFirestore.instance;

    try {
      await ref
          .collection('questions')
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  Item item = new Item();
                  var newkey = (doc["category"]) - rf;
                  item.key = newkey;
                  item.question = (doc["question"]);
                  item.answer = (doc["answer"]);
                  i++;
                  questions.add(item);
                })
              });
    } catch (e) {
      print(e.message);
    }

    /*
    map.docs.forEach((doc) {
      item.key = i;
      item.question = doc["question"];
      item.answer = doc["answer"];
      print(doc["question"]);
      print(doc["answer"]);
      i++;
      questions.add(item);
    });
    print("Questions");
    print(questions.length);
    */

    /*
    Map<int, DocumentSnapshot> mapped = ds.asMap();

    ItemsList itemList = new ItemsList();
    List<Item> questions = itemList.mapToList(mapped);
    */
    return questions;
  }
}
