import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_tamil/vanakam%20malar%201.dart';
class Vanakammalar extends StatefulWidget {
  const Vanakammalar({Key key}) : super(key: key);

  @override
  _VanakammalarState createState() => _VanakammalarState();
}

class _VanakammalarState extends State<Vanakammalar> {
  String _chosenValue;
  String _chosenValue2;
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
          child: Center(
            child: Container(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 200,right: 0.0,bottom: 0.0,top:150.0),
                    child: DropdownButton<String>(
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
                  ),
                  Padding(

                    padding: const EdgeInsets.only(left: 0.0,right:200,bottom: 200,top:150),
                    child: DropdownButton<String>(
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
                  ),
                ],
              ),
            ),
            ),
        ),
    floatingActionButton: Padding(padding: EdgeInsets.symmetric(horizontal: 110,vertical: 50),child:
    FloatingActionButton.extended(
    elevation: 20,
    onPressed: () {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Vanakammalar1()));
    },
    label: const Text("தொடங்கவும்"),
    splashColor: Colors.lightBlue[300],
    hoverElevation: 20,
    icon: const Icon(Icons.arrow_right),
    backgroundColor: Colors.cyan[600],
    ),
      ),
    ));
  }
}
