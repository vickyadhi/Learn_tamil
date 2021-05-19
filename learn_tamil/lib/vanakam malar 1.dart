import 'package:flutter/material.dart';
import 'package:learn_tamil/checkbox.dart';
import 'package:learn_tamil/katralpayirchi.dart';

class Vanakammalar1 extends StatefulWidget {
  const Vanakammalar1({Key key}) : super(key: key);

  @override
  _Vanakammalar1State createState() => _Vanakammalar1State();
}

class _Vanakammalar1State extends State<Vanakammalar1> {
  bool value = false;
  final List=[
    ListSettings(title: 'மரபுத்தொடர்கள் '),
    ListSettings(title: 'பழமொழிகள் '),
    ListSettings(title: 'உவமைத்தொடர்கள் '),
    ListSettings(title: 'இணைமொழிகள் ')
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
                    Padding(padding:EdgeInsets.symmetric(vertical: 10) ),
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
                   elevation: 20,
                   onPressed: () {},
                   label: const Text("முகப்பு"),
                   splashColor: Colors.lightBlue[300],
                   icon: const Icon(Icons.arrow_right),
                   backgroundColor: Colors.cyan[600],
                 ),
                 )
               ],
             ),
              Padding(padding: EdgeInsets.fromLTRB(90, 790, 0, 0),child:
              FloatingActionButton.extended(
                autofocus: true,
                elevation: 20,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Vanakammalar2()));
                },
                label: const Text("அடுத்தது "),
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
          value: List.value,
          onChanged: (value)=> onClicked(),
      ),
    title: Text(List.title),
  );
}

