import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'answers_list.dart';
import '../models/flags_set.dart';
import '../models/display_results.dart';


class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

FlagsSet flags= new FlagsSet(true);
int roundid;
DisplayResults display=DisplayResults();
String currentresults;
bool unhide=true;

CarouselDemo(bool value,[int startid=0, results])
{
  
  print(flags.getdisableflag);

  flags.setdisableflag=value;

  currentresults=results ??=" ";

  

  
  roundid=startid;
}
  

 @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      CarouselSlider(
        //setState
        items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        if (i==1)
        {
          unhide=false;
        }
        else {
          unhide=true;
        
        }
        return 
        Scaffold (
          appBar: AppBar(title: Text("Football Geek War")),
          backgroundColor: Colors.green,
        body : Column (
        
        children: <Widget>[
        
        Text("Round "+i.toString()
        ,style: Theme.of(context).textTheme.headline1
        ),
        
        Text("Tap to start")
        
        , unhide ? Table( 
                border: TableBorder.all(color:Colors.white),
                children: [
                  TableRow( children: [
                    Column(children:[
                      Icon(Icons.show_chart, size: 50,color:Colors.white),
                      Text('Results')
                    ]),
                    Column(children:[
                      Icon(Icons.recent_actors, size: 50,color:Colors.white),
                      Text('Player One')
                    ]),
                    Column(children:[
                      Icon(Icons.recent_actors, size: 50,color:Colors.white),
                      Text('Player Two')
                    ]),
                  ]),
                  TableRow( children: [
                    Text ('Round '+i.toString()),
                    Text (currentresults),
                    Text (currentresults),
                  ]),
                ],
              )
        : Text (" ")
        ,Flexible (
        child:Container(
          height:400,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          //decoration: BoxDecoration(
          //  color: Colors.green,
            
          //),
          
          child: 
          GestureDetector(
                        //child: Image.network(i, fit: BoxFit.fill),
                        onTap: () {
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnswersList(i,flags,display),
                            ),
                          );
                            })
                      
                        )
        )
                ]
        )
        );
      },
    );
  }).toList(),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: 600,
          autoPlay: false,
          enlargeCenterPage:false,
          viewportFraction: 0.9,
          aspectRatio: 3.0,
          initialPage: roundid 
        ),
      ),
      /*
      RaisedButton(
        //enabled:false,
        onPressed: () => flags.getdisableflag ? null : buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear),
            
        //onPressed: () =>AnswersList(i),
        child: Text('Next Round'),
      )
      */
    ]
  );
}