import 'package:flutter/material.dart';
import 'package:factsapp/home.dart';
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
        appBar: AppBar(
          title: Text("Settings",style: TextStyle(color: Colors.white),),
          actions: <Widget>[IconButton(onPressed: ((){Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));}), icon: Icon(Icons.close,color:Colors.white))],
          backgroundColor: Colors.black,
        ),
        body: Column(
          
          children:[Center(
            child: Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Frequency",style: TextStyle(fontSize: 30),),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                setState((){
                  freq--;
                });
              }, icon: Icon(Icons.remove_circle_outline,size: 30,)),
              SizedBox(width: 10,),
              Text("${freq}X",style: TextStyle(fontSize:45 ),),
              SizedBox(width: 10,),
              IconButton(onPressed:(){
                setState((){
                  freq++;            });
              },icon:Icon(Icons.add_circle_outline,size: 30,)),
            ],
         
            ),
          ),
          Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Start Time",style: TextStyle(fontSize: 30),),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                setState((){
                  starttime--;
                });
              }, icon: Icon(Icons.remove_circle_outline,size: 30,)),
              SizedBox(width: 10,),
              Expanded(child: Text("0$starttime:00AM",style: TextStyle(fontSize:20 ),)),
              SizedBox(width: 10,),
              IconButton(onPressed:(){
                setState((){
                  starttime++;            });
              },icon:Icon(Icons.add_circle_outline,size: 30,)),
            ],
    
            ),
    
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("End  Time",style: TextStyle(fontSize: 30),),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                setState((){
                  endtime--;
                });
              }, icon: Icon(Icons.remove_circle_outline,size: 30,)),
              SizedBox(width: 10,),
              Expanded(child: Text("$endtime:00AM",style: TextStyle(fontSize:20 ),)),
              SizedBox(width: 10,),
              IconButton(onPressed:(){
                setState((){
                  endtime++;            });
              },icon:Icon(Icons.add_circle_outline,size: 30,)),
            ],
    
            ),
          ]
        ),
      ),
    );
  }
}