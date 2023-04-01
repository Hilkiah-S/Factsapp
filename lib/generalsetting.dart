import 'package:flutter/material.dart';
import 'package:factsapp/home.dart';
import 'package:intl/intl.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int freq=0;
  int starttime =6;
  int endtime=10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 172, 167, 167),
        appBar: AppBar(
          title: Text("Settings",style: TextStyle(color: Colors.white),),
          actions: <Widget>[IconButton(onPressed: ((){Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));}), icon: Icon(Icons.close,color:Colors.white))],
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Set Frequency for notification",style: TextStyle(color:Colors.black,fontSize: 20),),
            ),
            Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: ElevatedButton(
  onPressed: () {
    // action to perform when the button is pressed
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // background color of the button
    // text color
    minimumSize: Size(60, 80), // minimum size of the button
    padding: EdgeInsets.symmetric(horizontal: 16), // padding of the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // button border radius
    ),
  ),
  child: Text('1X',style: TextStyle(color:Colors.black,fontSize: 30),), // text displayed on the button
),
           ),
 Padding(
   padding: const EdgeInsets.all(10.0),
   child: ElevatedButton(
    onPressed: () {
      // action to perform when the button is pressed
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white, // background color of the button
      // text color
      minimumSize: Size(60, 80), // minimum size of the button
      padding: EdgeInsets.symmetric(horizontal: 16), // padding of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // button border radius
      ),
    ),
    child: Text('2X',style: TextStyle(color:Colors.black,fontSize: 30),), // text displayed on the button
),
 )
            ],
         
            ),
          ),
          ]
        ),
      ),
    );
  }
}