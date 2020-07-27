import 'package:flutter/material.dart';
import 'answers_list.dart';
import '../models/my_flutter_app_icons.dart';
import 'package:ant_icons/ant_icons.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Kick Off KO")),
        backgroundColor: Colors.white,
        body: new GestureDetector(
            onTap: () {
              // call this method here to hide soft keyboard

              FocusScope.of(context).unfocus();
            },
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/kfkw.jpeg"),
                        fit: BoxFit.scaleDown)
                    //, color: Colors.white,
                    ),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: RaisedButton(
                            child: Text('Play Single Player Game'),
                            color: Colors.green,
                            onPressed: () {
                              Navigator.pushNamed(context, '/SinglePlayer');
                            },
                          )),
                      //Spacer(),
                      /*
            RaisedButton
            (child: Text ('Play Multi Player Game'),
            color: Colors.red,
            onPressed: () {Navigator.pushNamed(context,'/MultiPlayer'); }
            ),
            */
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: RaisedButton.icon(
                              label: Text('Play Multi Player'),
                              icon: Icon(
                                AntIcons.usergroup_add,
                                color: Colors.white,
                              ),
                              //color: Colors.purple,
                              onPressed: () {
                                Navigator.pushNamed(context, '/Carousel');
                              }))
                    ])))));
  }
}
