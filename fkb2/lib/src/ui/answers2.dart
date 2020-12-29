import 'package:flutter/material.dart';
import '../models/item_model3.dart';
import '../blocs/answers_bloc.dart';
import '../models/compare_guess.dart';
//import 'package:quiver/async.dart';
import '../models/flags_set.dart';
//import 'package:timer_button/timer_button.dart';
import 'data_display.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import '../models/display_results.dart';
import '../models/round.dart';
import '../models/players.dart';

class Answers2 extends StatefulWidget {
  @override
  int dataid;
  DisplayResults results;
  Players matched;
  Round round = Round();

  Answers2() {
    //flag.setdisableflag = false;
    //dataid = round.getroundid();
    /* Find Random Player */
    matched = Players();
    results = DisplayResults();
    //DisplayResults results;

    //_TextFieldExState createState() => new _TextFieldExState(round, results);
  }

  _TextFieldExState createState() => new _TextFieldExState(round, results);
}

class _TextFieldExState extends State<Answers2> {
  TextEditingController _c;
  List<String> textarray = new List();
  String fmtString = "";
  String displayText = "";
  String totstr = "";
  int total = 0;
  bool gameon = true;
  bool game_end = false;
  String gamestart = 'Start';
  int dataid;
  Duration _duration = Duration(seconds: 30);
  DisplayResults results;
  Round round;
  var dataList = <String>[];

  _TextFieldExState(Round round, DisplayResults display) {
    dataid = round.getroundid();
    results = display;
  }

  //String _text = "initial";

  int _start = 20;
  int _current = 0;

  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.orange[200],
        body: new GestureDetector(
            onTap: () {
              // call this method here to hide soft keyboard

              //FocusScope.of(context).unfocus();

              if (game_end) {
                print('Data ' + dataid.toString());
                //results.ShowResults(dataid);
                Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataDisplay(
                            true, dataid, results.ShowResults(dataid))));
              }
            },
            behavior: HitTestBehavior.translucent,
            child: FutureBuilder<List<Item>>(
                future: guess.getnewdata(dataid),
                builder: (context, AsyncSnapshot<List<Item>> snapshot) {
                  if (snapshot.hasData)
                    return Container(
                        child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SlideCountdownClock(
                          duration: _duration,
                          slideDirection: SlideDirection.Down,
                          separator: ":",
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          onDone: () {
                            game_end = true;
                            gameon = false;
                            results.SaveResults(dataid, displayText);
                          },
                        ),
                        Text("$_current"),
                        new Text(snapshot.data[0].question,
                            style: Theme.of(context).textTheme.headline1),
                        new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: new TextField(
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                //hintText: 'hint costs xxx',
                                enabled: gameon,
                                helperText:
                                    'Press Submit after each answer. Tap for next Round',
                                labelText: 'Answer',
                                prefixIcon: const Icon(
                                  Icons.text_fields,
                                  color: Colors.blue,
                                ),
                                prefixText: ' ',
                                //suffixText: 'USD',
                                suffixStyle:
                                    const TextStyle(color: Colors.blue)),
                            onSubmitted: (v) => setState(() {}),
                            controller: _c,
                          ),
                        ),
                        new Text(displayText,
                            style: Theme.of(context).textTheme.bodyText2),
                        new Text(totstr,
                            style: Theme.of(context).textTheme.headline6),
                        new RaisedButton(
                          child: new Text("Submit"),
                          onPressed: () {
                            if (gameon) {
                              setState(() {
                                /* check not existed before */

                                String ta;
                                bool newvalue = true;

                                /* Check if new value *** */

                                newvalue =
                                    results.newValueCheck(dataid, _c.text);

                                print("guess status");
                                print(newvalue);
                                if (newvalue) {
                                  //textarray.add(_c.text);

                                  int res =
                                      guess.comparison(_c.text, snapshot.data);
                                  total = total + res;
                                  totstr = 'Total is ' + total.toString();
                                  displayText = displayText +
                                      _c.text +
                                      ' ' +
                                      res.toString() +
                                      '\n';
                                }
                                _c.text = "";
                                newvalue = true;
                              });
                            }
                          },
                        ),
                      ],
                    ));
                  else {
                    return new CircularProgressIndicator();
                    //print("data slow");
                  }
                })));
  }
}
