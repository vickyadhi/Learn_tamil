import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_tamil/tamilvanakam.dart';

void main() => runApp(MaterialApp(home:Startpage()));

class Startpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: Text(
            "Learn tamil",
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
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 90,horizontal: 60)),
                Image.asset("assets/logo.png")
              ],
            ),
          ),
        floatingActionButton: Padding(padding: EdgeInsets.symmetric(horizontal: 110,vertical: 50),child:
        FloatingActionButton.extended(
          elevation: 20,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Tamilvanakam()));
          },
          label: const Text("தொடங்கவும்"),
          splashColor: Colors.lightBlue[300],
          hoverElevation: 20,
          icon: const Icon(Icons.arrow_right),
          backgroundColor: Colors.cyan[600],
        ),
        ),
      ),
    );
  }
}
