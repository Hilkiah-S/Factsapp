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
            
            toolbarHeight: 40,
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child:Column(
              children: [
                Stack(
  children: [
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: 
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:1)));
                        setState(() {
                          generalbool ? generalbool = false : generalbool = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex:1,
                      child: Container(
                                       
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/general.jpg"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Text("General", style: TextStyle(color: Colors.white, fontSize: 30)),
                          ),
                          ),
                    ),
       ] ),
                    ),
                    ),
                    
                    
                    
                    )),
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: 
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Row(
             
                  children: [
                    Flexible(
                    flex:1,
                    child: GestureDetector(
                      onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:3)));
                      setState(() {
                        generalbool ? generalbool = false : generalbool = true;
                      });
                    },
                      child: Container(
                                       
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/sport.jpg"),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Text("Sports", style: TextStyle(color: Colors.white, fontSize: 30)),
                          ),
                          ),
                    ),
                    ),
                    SizedBox(width:8),
                   Flexible(
                    flex:1,
                    child: GestureDetector(
                      onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:4)));
                      setState(() {
                        generalbool ? generalbool = false : generalbool = true;
                      });
                    },
                      child: Container(
                                       
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/jaguar.jpg"),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Text("Animals", style: TextStyle(color: Colors.white, fontSize: 30)),
                          ),
                          ),
                    ),
                    ),
       ] ),
                    ),
                    
                    
                    
                    )),
                     Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: 
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Row(
             
                  children: [
                    Flexible(
                    flex:1,
                    child: GestureDetector(
                      onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:6)));
                      setState(() {
                        generalbool ? generalbool = false : generalbool = true;
                      });
                    },
                      child: Container(
                                       
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/humanbody.jpg"),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child:Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
      
    ],
  ),
  child: Text(
    'Human body',
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      
    ),
  ),
)
                          ),
                          ),
                    ),
                    ),
                    SizedBox(width:8),
                   Flexible(
                    flex:1,
                    child: GestureDetector(
                      onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:5)));
                      setState(() {
                        generalbool ? generalbool = false : generalbool = true;
                      });
                    },
                      child: Container(
                                       
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/science.jpg"),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
   
  ),
  child: Text(
    'Science',
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      
    ),
  ),
)
,
                          ),
                          ),
                    ),
                    ),
       ] ),
                    ),
                    
                    
                    
                    )),
                    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: 
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Row(
             
                  children: [
            
                   Flexible(
                    flex:1,
                    child: GestureDetector(
                      onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(select:7)));
                      setState(() {
                        generalbool ? generalbool = false : generalbool = true;
                      });
                    },
                      child: Container(
                                       
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/Lifehacks.jpg"),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0,5),
                              ),],
                             border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Text("Life Hacks", style: TextStyle(color: Colors.white, fontSize: 30)),
                          ),
                          ),
                    ),
                    ),
       ] ),
                    ),
                    
                    
                    
                    ))
        
        



                    ]
                    )]
                    )]))))
            ;
    
  
    
  }
}