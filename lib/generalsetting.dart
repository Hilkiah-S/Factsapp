import 'package:flutter/material.dart';
import 'package:factsapp/home.dart';

import'package:hive_flutter/hive_flutter.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final _mybox = Hive.box('testbox');
  int freq=0;

  int starttime =6;
  int endtime=10;
   TimeOfDay time=TimeOfDay(hour:10,minute:30);
   @override
   void initState(){
    if(!(_mybox.get(23)==null)){
   if(!(time==_mybox.get(23))){
    setState(() {
      time=_mybox.get(23);
    });
   }}
   }
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
              child: Text("Schedule Notification",style: TextStyle(color:Colors.black,fontSize: 20),),
            ),
            Center(
            child: Column(
              children: [
                Text("${time.hour}:${time.minute}",style: TextStyle(fontSize: 40),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
           Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: ElevatedButton(
  onPressed: () async{
    TimeOfDay? newTime = await 
    showTimePicker(context: context, initialTime:time);
    // action to perform when the button is pressed
    if(newTime==null)return;
    setState(() {
      time=newTime;
    });
    _mybox.put(23,time);
    setState(() {
     time= _mybox.get(23);
    });
    },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // background color of the button
    // text color
    minimumSize: Size(70, 57), // minimum size of the button
    padding: EdgeInsets.symmetric(horizontal: 16), // padding of the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // button border radius
    ),
  ),
  child: Text('Set time',style: TextStyle(color:Colors.black,fontSize: 25),), // text displayed on the button
),
           ),
                ],
         
                ),
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}