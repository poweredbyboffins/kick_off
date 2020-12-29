//import 'package:firebase_core/firebase_core.dart';
import '../resources/getfsdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Players {
  String name;

  List<Player> matches;

  Players() {
    GetFirestoreData fd;

    fd = new GetFirestoreData();
    print('FD REF');
    print(fd.ref);

    //fd.ref.collection('users').get();
    /*
    try {
      fd.ref.collection('users').get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Player item = new Player();
              var newkey = (doc["name"]);
              item.name = newkey;
              matches.add(item);
            })
          });
    } catch (e) {
      print(e.message);
    }
    */
  }
}

class Player {
  String name;

  Player({this.name});
}
