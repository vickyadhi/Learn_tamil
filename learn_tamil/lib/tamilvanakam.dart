import 'package:flutter/material.dart';
import 'package:learn_tamil/vanakam%20malar.dart';
import 'package:gender_selection/gender_selection.dart';

void main() => runApp(Tamilvanakam());

class Tamilvanakam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: Text(
            "தமிழ் வணக்கம்",
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
          child: Center(
            child: GenderSelection(
              maleText: "",
              femaleText: "",
              selectedGenderIconBackgroundColor: Colors.blueGrey,
              onChanged: (Gender gender) {
                print(gender);
              },
              equallyAligned: true,
              animationDuration: Duration(milliseconds: 700),
              isCircular: true,
              isSelectedGenderIconCircular: true,
              opacityOfGradient: 0.4,
              padding: EdgeInsets.only(bottom: 200),
              size: 150,
            ),
          ),
        ),
        floatingActionButton:Padding(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          child: FloatingActionButton.extended(
          elevation: 20,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Vanakammalar()));
          },
          label: const Text("உங்கள் கணக்கை துவங்குங்கள்"),
          splashColor: Colors.lightBlue[300],
          hoverElevation: 20,
          icon: const Icon(Icons.arrow_right),
          backgroundColor: Colors.cyan[600],
        ),
      ),
    ));
  }
}


