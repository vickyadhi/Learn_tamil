import 'package:flutter/material.dart';
import 'package:learn_tamil/checkbox.dart';
import 'package:learn_tamil/payirchi.dart';

class Vanakammalar2 extends StatefulWidget {
  const Vanakammalar2({Key key}) : super(key: key);

  @override
  _Vanakammalar2State createState() => _Vanakammalar2State();
}

class _Vanakammalar2State extends State<Vanakammalar2> {
  bool value = false;
  final List=[
    ListSettings(title: 'கற்றல்பயிற்சி '),
    ListSettings(title: 'தேர்வுபயிற்சி'),
  ];

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
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(90, 190, 40,90),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                ...List.map(buildSingleCheckbox).toList(),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(55, 841, 0, 20),child:

                FloatingActionButton.extended(
                  autofocus: true,
                  elevation: 15,
                  onPressed: () {},
                  label: const Text("முகப்பு"),
                  splashColor: Colors.lightBlue[300],
                  icon: const Icon(Icons.arrow_right),
                  backgroundColor: Colors.cyan[600],
                ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(80, 790, 0, 5),child:
            FloatingActionButton.extended(
              autofocus: true,
              elevation: 15,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Payirchi()));
              },
              label: const Text("அடுத்தது"),
              splashColor: Colors.lightBlue[300],
              icon: const Icon(Icons.arrow_right),
              backgroundColor: Colors.cyan[600],
            ),
            ),
          ],
        ),),
    );
  }
  Widget buildSingleCheckbox(ListSettings List)=>buildCheckbox(
      List: List,
      onClicked: (){
        setState(() {
          final newValue= !List.value;
          List.value=newValue;
        });
      }
  );
  Widget buildCheckbox({
    @required ListSettings List,
    @required VoidCallback onClicked,
  }) => ListTile(
    onTap: onClicked,
    leading: Checkbox(
      activeColor: Colors.white60,
      value: List.value,
      onChanged: (value)=> onClicked(),
    ),
    title: Text(List.title),
  );
}

