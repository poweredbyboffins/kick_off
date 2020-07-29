import 'package:flutter/material.dart';
import '../models/item_model2.dart';
import '../blocs/answers_bloc.dart';
import '../models/compare_guess.dart';
//import 'package:quiver/async.dart';
import '../models/flags_set.dart';
//import 'package:timer_button/timer_button.dart';
import 'carousel_display.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import '../models/display_results.dart';

class AnswersList extends StatefulWidget {
  @override
  int carouselid;
  DisplayResults results;

  AnswersList(int i, [FlagsSet flag, DisplayResults display]) {
    flag.setdisableflag = false;
    carouselid = i;
    results = display;
  }

  _TextFieldExState createState() => new _TextFieldExState(carouselid, results);
}

class _TextFieldExState extends State<AnswersList> {
  TextEditingController _c;
  List<String> textarray = new List();
  String fmtString = "";
  String displayText = "";
  String totstr = "";
  int total = 0;
  bool gameon = true;
  bool game_end = false;
  String gamestart = 'Start';
  int carouselid;
  Duration _duration = Duration(seconds: 20);
  DisplayResults results;
  var dataList = <String>[];

  _TextFieldExState(int i, DisplayResults display) {
    carouselid = i;
    results = display;
    //int index = i - 1;
    //dataList[index] = display.data;
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
                Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarouselDisplay(
                            //true, carouselid, results.ShowResults(carouselid)),
                            true,
                            carouselid,
                            results.ShowResults(carouselid)))
                    //dataList[carouselid])

                    );
              }
            },
            behavior: HitTestBehavior.translucent,
            child: FutureBuilder<List<Item>>(
                future: guess.getdata(carouselid),
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
                            print('carousel ' + carouselid.toString());
                            //DisplayResults results= DisplayResults(displayText);
                            //dataList.add(displayText);
                            results.SaveResults(carouselid, displayText);
                            //results.SetIndex = carouselid;
                            //results.SaveData = displayText;
                            //dataList[carouselid] = displayText;
                            //print('Results are ' +
                            //    results.ShowResults(carouselid));
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
                                //print ("button");

                                textarray.add(_c.text);
                                String ta;
                                for (var i = 0; i < textarray.length; i++) {
                                  ta = textarray[i];
                                  fmtString = fmtString + ta;
                                  String nl = '\n';
                                  fmtString = fmtString + nl;
                                }

                                int res =
                                    guess.comparison(_c.text, snapshot.data);
                                total = total + res;
                                totstr = 'Total is ' + total.toString();
                                displayText = displayText +
                                    _c.text +
                                    ' ' +
                                    res.toString() +
                                    '\n';
                                _c.text = "";
                              });
                            }
                          },
                        ),
                      ],
                    ));
                })));
  }
}
