import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'answers_list.dart';
import '../models/flags_set.dart';
import '../models/display_results.dart';
import 'package:ant_icons/ant_icons.dart';
import 'textstyle.dart';

class CarouselDisplay extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  FlagsSet flags = new FlagsSet(true);
  int roundid = 1;
  //
  //DisplayResults display;
  DisplayResults display = DisplayResults();

  String currentresults;
  bool unhide = true;

  CarouselDisplay(bool value, [int startid = 0, var results]) {
    print(flags.getdisableflag);

    flags.setdisableflag = value;

    currentresults = results ?? " ";
    //display = results;
    print('CarouselDisplay ' + roundid.toString());
    roundid = startid;
  }

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          //setState
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                if (i == 1) {
                  unhide = false;
                } else {
                  unhide = true;
                }
                return Scaffold(
                    appBar: AppBar(title: Text("Football Geek War")),
                    backgroundColor: Colors.green,
                    body: Column(children: <Widget>[
                      Text("Round " + i.toString(),
                          style: textstyle.display_res()),
                      Text("Tap to start", style: textstyle.display_res()),
                      unhide
                          ? Table(
                              //border: TableBorder.all(color: Colors.white),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Icon(Icons.show_chart,
                                        size: 50, color: Colors.white),
                                    Text('Results',
                                        style: textstyle.display_res())
                                  ]),
                                  Column(children: [
                                    Icon(AntIcons.user,
                                        size: 50, color: Colors.white),
                                    Text('Player One',
                                        style: textstyle.display_res())
                                  ]),
                                  Column(children: [
                                    Icon(AntIcons.user,
                                        size: 50, color: Colors.white),
                                    Text('Player Two',
                                        style: textstyle.display_res())
                                  ]),
                                ]),
                                TableRow(children: [
                                  Text('Round ' + i.toString(),
                                      style: textstyle.display_res()),
                                  Text(currentresults,
                                      style: textstyle.display_res()),
                                  Text(currentresults,
                                      style: textstyle.display_res()),
                                ]),
                              ],
                            )
                          : Text(" "),
                      Flexible(
                          child: Container(
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                  //child: Image.network(i, fit: BoxFit.fill),
                                  onTap: () {
                                print('Round ' + roundid.toString());
                                print('i' + i.toString());
                                if (roundid <= i) {
                                  Navigator.push<Widget>(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AnswersList(i, flags, display)),
                                  );
                                }
                              })))
                    ]));
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              height: 600,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 0.9,
              aspectRatio: 3.0,
              //onPageChanged:
              initialPage: roundid),
        ),
      ]);
}
