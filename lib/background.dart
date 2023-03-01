import 'package:flutter/material.dart';
import 'package:factsapp/home.dart';
class Background extends StatelessWidget {
  String a="wallone.jpg";
  String b="walltwo.jpg";
  String c="wallthree.jpg";
  String d="wallfour.jpg";
  String e="wallfive.jpg";
  String f="wallsix.jpg";
  String g="wallseven.jpg";
  String h="walleight.jpg";
  // const Background({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(title: Text("Background Image"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:a)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/galaxy.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:b)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/walltwo.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:c)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/wallthree.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:d)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/wallfour.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:e)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/wallfive.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:f)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/wallsix.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:g)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/wallseven.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
               Row(
                children: [
                  Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(wall:h)));
                                },
                                child: Container(
                    
                                  margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/walleight.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                                                    ),],
                                    
                                  ),),
                              ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}