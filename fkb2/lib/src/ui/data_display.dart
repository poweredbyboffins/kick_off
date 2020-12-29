import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'answers2.dart';
import '../models/flags_set.dart';
import '../models/display_results.dart';
import '../models/round.dart';
import 'package:ant_icons/ant_icons.dart';
import 'textstyle.dart';

class DataDisplay extends StatelessWidget {
  FlagsSet flags = new FlagsSet(true);
  int i = 1;
  int MAX = 5;
  //
  //DisplayResults display;
  DisplayResults display = DisplayResults();
  //DisplayResults display;

  Round round = Round();

  String currentresults;
  bool unhide = true;

  DataDisplay(bool value, [int roundid = 0, var results]) {
    print(flags.getdisableflag);

    flags.setdisableflag = value;

    currentresults = results ?? " ";
    i = roundid;
  }

  Widget getButton(BuildContext context) {
    print('Value of i' + i.toString());
    round.incrementroundid(i);
    print(round.lastround());
    return round.lastround()
        ? RaisedButton(
            child: Text('New Game'),
            color: Colors.red[50],
            onPressed: () {
              Navigator.pushNamed(context, '/');
            })
        : RaisedButton(
            child: Text('Next Round'),
            color: Colors.red[50],
            onPressed: () {
              Navigator.pushNamed(context, '/MultiPlayer');

              //MaterialPageRoute(builder: (context) => Answers2(i + 1));
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Football Geek War")),
        backgroundColor: Colors.green,
        body: Column(children: <Widget>[
          Text("Round " + i.toString(), style: textstyle.display_res_yellow()),
          Text("Tap to start", style: textstyle.display_res()),
          unhide
              ? Table(
                  //border: TableBorder.all(color: Colors.white),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Icon(Icons.show_chart, size: 50, color: Colors.white),
                        Text('Results', style: textstyle.display_res_yellow())
                      ]),
                      Column(children: [
                        Icon(AntIcons.user, size: 50, color: Colors.white),
                        Text('Player One',
                            style: textstyle.display_res_yellow())
                      ]),
                      Column(children: [
                        Icon(AntIcons.user, size: 50, color: Colors.white),
                        Text('Player Two',
                            style: textstyle.display_res_yellow())
                      ]),
                    ]),
                    TableRow(children: [
                      Text('Round ' + i.toString(),
                          style: textstyle.display_res()),
                      Text(currentresults, style: textstyle.display_res()),
                      Text(currentresults, style: textstyle.display_res()),
                    ]),
                  ],
                )
              : Text(" "),
          //round.lastround() ?

          getButton(context)

          /*Flexible(
              child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                      //child: Image.network(i, fit: BoxFit.fill),
                      onTap: () {
                    //print('Round ' + roundid.toString());
                    print('i' + i.toString());
                    if (MAX <= i) {
                      print('here');

                      Navigator.push<Widget>(
                        context,
                        MaterialPageRoute(builder: (context) => Answers2(i)),
                      );

                      RaisedButton(
                          child: Text('Next Round'),
                          color: Colors.red,
                          onPressed: () {
                            MaterialPageRoute(
                                builder: (context) => Answers2(i + 1));
                          });
                    }
                  })))
          */
        ]));
  }
}
