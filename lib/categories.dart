import 'package:flutter/material.dart';
import 'package:factsapp/home.dart';

class Category extends StatefulWidget {
  // const Category({super.key});
  

  
 Category({Key? mykey}) : super(key: mykey);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
 bool generalbool=false;
 bool universebool=false;
 bool lifehackbool=false;
 bool humanbodybool=false;
 bool sportbool=false;
 bool animalbool=false;
 bool sciencebool=false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[IconButton(onPressed: ((){Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));}), icon: Icon(Icons.close,color:Colors.white))],
            title:Text("Categories",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
            
            toolbarHeight: 50,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                   
                    
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                            
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:1)));
                                
                              setState(() {
                                generalbool? generalbool=false:generalbool=true;
                              });
                            },
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/general.jpg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: generalbool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("General",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
                      
            
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                               
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:2)));
                                
                              setState(() {
                                universebool? universebool=false:universebool=true;
                              });
                            },
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/universe.jpg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: universebool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("Universe",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
            
            
            
                    
                    ],
                ),
                Row(
                  children: [
                   
                    
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                              
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:3)));
                                
                              setState(() {
                                sportbool? sportbool=false:sportbool=true;
                              });
                            },
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/sport.jpg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: sportbool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("Sports",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
                      
            
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:4)));
                              setState(() {
                                animalbool? animalbool=false:animalbool=true;
                              });
                            },
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/jaguar.jpg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: animalbool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("Animals",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
            
            
            
                    
                    ],
                ),
                Row(
                  children: [
                   
                    
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:5)));
                              setState(() {
                                sciencebool? sciencebool=false:sciencebool=true;
                              });
                            },
                            child: Expanded(
                              
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/science.jpg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: sciencebool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("Science",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
                      
                        
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:6)));
                              setState(() {
                                humanbodybool? humanbodybool=false:humanbodybool=true;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                                    width: 500,
                                    height: 300,
                                    decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("images/humanbody.jpg"),fit: BoxFit.cover),
                                borderRadius:BorderRadius.circular(20),
                                boxShadow:  [BoxShadow(
                                  blurRadius: 5.0,
                                  offset: Offset(0,5),
                          ),],
                                
                              ),
                              child: Visibility(
                                visible: humanbodybool,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                              ),),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Expanded(
                              child: Text("Human Body",style: TextStyle(color: Colors.white,fontSize: 30, shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0.0, 0.5),
                                              blurRadius: 5.0,
                                              color: Color.fromARGB(255, 0, 0, 0),
                                            ),]),),
                            ))),
                                            ],
                                          ),
                        ),
                        
                        
                        
                    
                    ],
                ),
                
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                                children: <Widget>[
                              
                              GestureDetector(
                                onTap:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:7)));
                                  setState(() {
                                    lifehackbool? lifehackbool=false:lifehackbool=true;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                        width: 500,
                                        height: 300,
                                        decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/Lifehacks.jpg"),fit: BoxFit.cover),
                                    borderRadius:BorderRadius.circular(20),
                                    boxShadow:  [BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0,5),
                              ),],
                                    
                                  ),
                                  child: Visibility(
                                    visible: lifehackbool,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                  ),),
                              ),
                                                 
                              Positioned.fill(child: Align(
                                alignment: Alignment.center,
                                child: Text("Life hacks",style: TextStyle(color: Colors.white,fontSize: 30,shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 0.5),
                                    blurRadius: 5.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),]),))),
                                                ],
                                              ),
                            ),
                            
                        Expanded(
                          child: Stack(
                                            children: <Widget>[
                          
                          GestureDetector(
                            onTap:() {
                               
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(select:8)));
                                
                              setState(() {
                                universebool? universebool=false:universebool=true;
                              });
                            },
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                      width: 500,
                                      height: 300,
                                      decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/human.jpeg"),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(20),
                                  boxShadow:  [BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0,5),
                                                  ),],
                                  
                                ),
                                child: Visibility(
                                  visible: universebool,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.check_circle_outline_rounded ,color: Color.fromARGB(255, 44, 245, 51),size:70)),
                                ),),
                            ),
                          ),
                                             
                          Positioned.fill(child: Align(
                            alignment: Alignment.center,
                            child: Text("Sex",style: TextStyle(color: Colors.white,fontSize: 30),))),
                                            ],
                                          ),
                        ),
                          ],
                        ),
            
            
              ],
            ),
          ),
        ),
    );
    
  }
}