import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value*100;
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
              Padding(padding: EdgeInsets.symmetric(vertical: 80)),
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 1, 40.0, 60),
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
                padding: EdgeInsets.fromLTRB(40.0, 1, 40.0, 60),
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
              )
            ],
          ),
        ),
      )
    );
  }
}
