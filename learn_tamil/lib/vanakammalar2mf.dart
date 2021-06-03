import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';

class Vanakammalar2mf extends StatefulWidget {
  const Vanakammalar2mf({Key key}) : super(key: key);

  @override
  _Vanakammalar2mfState createState() => _Vanakammalar2mfState();
}

class _Vanakammalar2mfState extends State<Vanakammalar2mf> {
  String _chosenValue;
  String _chosenValue2;
  int _radioValue=0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Row(
            children: [
              Center(
                child:Container(
                  child: Column(
                    children: [
                       DropdownButton<String>(
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black87),
                          dropdownColor:  Colors.cyan[400],
                          items: <String>[
                            'தமிழ்',
                            'ss',
                            'fl',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "உயர்நிலை",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      DropdownButton<String>(
                          value: _chosenValue2,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.cyan[400],
                          items: <String>[
                            'd',
                            'ldld',
                            'slsp',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "உயர்நிலை",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue2 = value;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
              GenderSelection(
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
                padding: EdgeInsets.fromLTRB(0.0, 0, 0, 100),
                size: 90,
              )
            ],
          ),
        ),
        floatingActionButton: Padding(padding: EdgeInsets.symmetric(horizontal: 110,vertical: 50),child:
        FloatingActionButton.extended(
          elevation: 20,
          onPressed: () {
          },
          label: const Text("தொடங்கவும்"),
          splashColor: Colors.lightBlue[300],
          hoverElevation: 20,
          icon: const Icon(Icons.arrow_right),
          backgroundColor: Colors.cyan[600],
        ),
        ),
      )
    );
  }
}
