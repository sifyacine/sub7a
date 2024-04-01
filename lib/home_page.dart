import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  resetToZero({bool resetGoal = false}){
    setCounter(_counter = 0);
    setAttempts(_attempts = 0);
    resetGoal ? setGoal(_goal = 1): null;
  }
  setCounter(int value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", value);
    getCounter();
  }

  setAttempts(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("attempts", value);
  }
  setGoal(int value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("goal", value);
    getCounter();
  }
  setColor(int value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("color", value);
    getCounter();
  }

  getCounter() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt("counter")?? 0;
      _attempts = prefs.getInt("attempts")?? 0;
      _goal = prefs.getInt("goal")?? 0;
      colorHex = prefs.getInt("color") ?? 0xFFB1001C;

    });
  }
  @override
  void initState() {
    getCounter();
    super.initState();
  }
  int rad = 0;
  int colorHex = 0xFFB1001C;
  int _counter = 0;
  int _attempts = 0;
  int _goal = 1;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(colorHex);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            resetToZero(resetGoal: true);
          },
          backgroundColor: mainColor,
          child: Icon(Icons.refresh),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap:(){
                  setState(() {
                    isActive = !isActive;
                    },
                  );
                  },
                child: Icon(
                      isActive ? Icons. color_lens_outlined : Icons.color_lens,
                    ),
              ),
            ),

          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "GOAL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: (){
                            resetToZero(resetGoal: false);
                            setGoal(_goal + 1);
                          },
                          icon: Icon(
                              Icons.add_circle,
                            color: Colors.white,
                          ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$_goal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          resetToZero(resetGoal: false);
                          if (_goal != 0){
                            setGoal(_goal - 1);
                          } else {
                            setGoal(_goal = _goal);
                          }
                        },
                        icon: Icon(
                          color: Colors.white,
                          Icons.remove_circle,
                          ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:(){
                          resetToZero();
                          setGoal(_goal = 1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            "1",

                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap:(){
                          resetToZero();
                          setGoal(_goal = 33);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            '33',

                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap:(){
                          resetToZero();
                          setGoal(_goal = 100);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            "100",

                          ),
                        ),
                      ), SizedBox(width: 8,),
                      GestureDetector(
                        onTap:(){
                          resetToZero();
                          setGoal(_goal = _goal+ 100);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            "+100",

                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap:(){
                          resetToZero();
                          setGoal(_goal = _goal+ 1000);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            "+1000",

                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "counter",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "$_counter",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 35,),
                CircularPercentIndicator(
                  radius: 75.0,
                  lineWidth: 5.0,
                  percent: _counter/_goal,
                  center: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_counter >= _goal){
                          setAttempts(_attempts + 1);
                          setCounter(_counter = 1);
                        }
                        else{
                          setCounter(_counter + 1);
                        }
                      });
                    },
                    child: Icon(
                      Icons.touch_app,
                      size: 50.0,
                      color: mainColor,
                    ),
                  ),
                  backgroundColor: mainColor.withOpacity(0.2),
                  progressColor: mainColor,
                ),
                SizedBox(height:35,),
                Text(
                  "attempts : $_attempts",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "total : ${_attempts*_goal + _counter}",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Visibility(
                    visible: isActive,
                    child: Row(
                       children: [
                         Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFFB1001C)), value: 0xFFB1001C, groupValue: colorHex, onChanged: (val){setState(() {setColor(val!);});},),
                         Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF14212A)), value: 0xFF14212A, groupValue: colorHex, onChanged: (val){setState(() {setColor(val!);});},),
                         Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF62249F)), value: 0xFF62249F, groupValue: colorHex, onChanged: (val){setState(() {setColor(val!);});},),
                         Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFFeb346e)), value: 0xFFeb346e, groupValue: colorHex, onChanged: (val){setState(() {setColor(val!);});},),

                       ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
