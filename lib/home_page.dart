import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int rad = 0;
  int colorHex = 0xFFB1001C;
  int _counter = 0;
  int _attempts = 0;
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(colorHex);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: mainColor,
          child: Icon(Icons.refresh),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.color_lens,
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
                          onPressed: (){},
                          icon: Icon(
                              Icons.add_circle,
                            color: Colors.white,
                          ),
                      ),Text(
                        "34",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: (){

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
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          "0",

                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          '33',

                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          "100",

                        ),
                      ), SizedBox(width: 8,),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          "+100",

                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          "+1000",

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
                  percent: _counter/33,
                  center: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_counter == 33){
                          _attempts++;
                          _counter = 0;
                        }
                        _counter++;
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
                  "total : 90",
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
                  child: Row(
                     children: [
                       Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFFB1001C)), value: 0xFFB1001C, groupValue: colorHex, onChanged: (val){setState(() {colorHex = val!;});},),
                       Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF14212A)), value: 0xFF14212A, groupValue: colorHex, onChanged: (val){setState(() {colorHex = val!;});},),
                       Radio(fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF62249F)), value: 0xFF62249F, groupValue: colorHex, onChanged: (val){setState(() {colorHex = val!;});},),

                     ],
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
