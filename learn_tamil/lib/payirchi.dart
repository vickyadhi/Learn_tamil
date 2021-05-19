import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Payirchi extends StatefulWidget {
  const Payirchi({Key key}) : super(key: key);

  @override
  _PayirchiState createState() => _PayirchiState();
}

class _PayirchiState extends State<Payirchi> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController= AnimationController(vsync: this,
      duration: Duration(seconds: 10 ),
    );

    animationController.addListener(() {
      setState(() {

      });
    });
     animationController.repeat();
    super.initState();
  }
  int _currentSelection=0;
  int _BoxShape;



  @override
  Widget build(BuildContext context) {
    final Map<String,double> dataMap={
      "Katral":4,
      "Thervu":9,
    };
    PieChart(dataMap: dataMap);
    final Map<int,Widget>_children=const<int,Widget>{
    0:Text('முகப்பு',style: TextStyle(color: Colors.black),),
      1:Text('எண்களை அறிந்து கொள்ள',style: TextStyle(color: Colors.black),)
    };
    final percentage = animationController.value*100;
    var colorList;
    return MaterialApp(
      home:Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: Text(
            "வணக்கம் மலர்",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.9,
                fontWeight: FontWeight.w600,
                letterSpacing: 6.9,
                decorationColor: Colors.cyan,
                decorationThickness: 80),
          ),
          centerTitle: true,
          toolbarHeight: 180,
          elevation: 20,
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width*2.89,

          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 110, 10, 640),
            child: FloatingActionButton.extended(
              elevation: 19,
              label: const Text("பயிற்சி",style: TextStyle(color: Colors.black87),),
              icon: const Icon(Icons.work,size: 25.0,color: Colors.white,),
              backgroundColor: Colors.cyan
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.cyan[400],
                  Colors.lightBlue[100],
                ],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 90),
               child: Container(
                 width: MediaQuery.of(context).size.width*1.2,
                 child: MaterialSegmentedControl(
                       children: _children,
                       selectionIndex: _currentSelection,
                       borderColor: Colors.black12,
                       selectedColor: Colors.cyan[200],
                       unselectedColor: Colors.white,
                       borderRadius: 32.0,
                       disabledChildren: [
                         2,
                       ],
                       onSegmentChosen: (index) {
      setState(() {
      _currentSelection = index;
      });
      },),
               ),
             ),
              Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 80)),
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 1, 30.0, 70),
                width: double.infinity,
                height: 120,
                child: LiquidLinearProgressIndicator(
                  value: 0.2,
                  valueColor: AlwaysStoppedAnimation(Colors.white60),
                  center: Text('20',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),
                  ),
                  direction: Axis.horizontal,
                  backgroundColor: Colors.cyan.shade300,
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1, 30.0, 70),
                  width: double.infinity,
                  height: 120,
                  child: LiquidLinearProgressIndicator(
                    value: 0.4,
                    valueColor: AlwaysStoppedAnimation(Colors.white60),
                    center: Text('40',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                    direction: Axis.horizontal,
                    backgroundColor: Colors.cyan.shade300,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
