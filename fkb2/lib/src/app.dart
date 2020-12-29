import 'package:flutter/material.dart';
import 'ui/base_app.dart';
import 'ui/answers_list.dart';
import 'ui/answers2.dart';
import 'ui/carousel_display.dart';
import 'models/flags_set.dart';
import 'models/display_results.dart';
import 'models/round.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Round round = Round();
    int i = round.setroundid(1);
    //DisplayResults results = DisplayResults();

    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.orange,
            buttonTheme: ButtonThemeData(minWidth: 250.0, height: 50.0),
            textTheme: TextTheme(
              //headlinebig: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            )),
        home: BaseApp(),
        routes: <String, WidgetBuilder>{
          '/SinglePlayer': (context) =>
              AnswersList(1, new FlagsSet(true), DisplayResults()),
          '/MultiPlayer': (context) => Answers2(),
          '/Carousel': (context) => CarouselDisplay(true),
        });
  }
}
