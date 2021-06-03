import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_tamil/vanakammalar2mf.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

enum legendShape { Circle, Rectangle }

class Payirchi extends StatefulWidget {
  const Payirchi({Key key}) : super(key: key);

  @override
  _PayirchiState createState() => _PayirchiState();
}

class _PayirchiState extends State<Payirchi>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  final List<Feature> features = [
  Feature(
  title: "கற்றல்",
  color: Colors.blue,
  data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
  ),
  Feature(
  title: "தேர்வு",
  color: Colors.black,
  data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
  ),];
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat();
    super.initState();
  }

  int _currentSelection = 0;
  int circle;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "கற்றல்": 1,
      "தேர்வு": 3,
    };
    List<Color> colorList = [
      Colors.black45,
      Colors.lightBlueAccent,
    ];

    PieChart(dataMap: dataMap);
    final Map<int, Widget> _children = const <int, Widget>{
      0: Text(
        'முகப்பு',
        style: TextStyle(color: Colors.black),
      ),
      1: Text(
        'எண்களை அறிந்து கொள்ள',
        style: TextStyle(color: Colors.black),
      )
    };
    final percentage = animationController.value * 100;
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
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 2.89,
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 110, 10, 640),
          child: FloatingActionButton.extended(
              elevation: 19,
              label:  Text(
                "பயிற்சி",
                style: TextStyle(color: Colors.black87),
              ),
              icon: const Icon(
                Icons.work,
                size: 25.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.cyan),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 90),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.2,
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
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80)),
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 1, 30.0, 70),
                width: double.infinity,
                height: 120,
                child: LiquidLinearProgressIndicator(
                  value: 0.2,
                  valueColor: AlwaysStoppedAnimation(Colors.white60),
                  center: Text(
                    '20',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
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
                    center: Text(
                      '40',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    direction: Axis.horizontal,
                    backgroundColor: Colors.cyan.shade300,
                  )),
              Text(
                "புள்ளிவிவரங்கள்",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 10),
                  chartLegendSpacing: 65,
                  chartRadius: MediaQuery.of(context).size.width / 3.0,
                  colorList: colorList,
                  initialAngleInDegree: 19,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  centerText: "மரபுத்தொடர்கள்",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 10),
                chartLegendSpacing: 65,
                chartRadius: MediaQuery.of(context).size.width / 3.0,
                colorList: colorList,
                initialAngleInDegree: 19,
                chartType: ChartType.ring,
                ringStrokeWidth: 20,
                centerText: "பழமொழிகள்",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 40)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 10),
                  chartLegendSpacing: 65,
                  chartRadius: MediaQuery.of(context).size.width / 3.0,
                  colorList: colorList,
                  initialAngleInDegree: 19,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  centerText: "உவமைத்தொடர்கள்",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 10),
                  chartLegendSpacing: 65,
                  chartRadius: MediaQuery.of(context).size.width / 3.0,
                  colorList: colorList,
                  initialAngleInDegree: 19,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  centerText: "இணைமொழிகள்",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
              ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 50),
               child: Text("💰 பதக்கங்கள்/",style: TextStyle(fontSize: 30),),
             ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 5, 100),
                child: Text("🎖️  🏆  🌟  ",style: TextStyle(fontSize: 60.9),),
              ),
              LineGraph(
                features: features,
                size: Size(420, 450),
                labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
                labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
                showDescription: true,
                graphColor: Colors.black87,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                height: 60,
                width: 200,
                child: RaisedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Vanakammalar2mf()));
                },
                  elevation: 20,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Text("அடுத்தது",style: TextStyle(fontSize: 18)),color: Colors.cyan,textColor: Colors.white,),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
