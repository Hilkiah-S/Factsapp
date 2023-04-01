import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

class Favour extends StatefulWidget {
  // const Favour({super.key});
var sent;

Favour({Key? mykey,this.sent}):super(key:mykey);
  @override
  State<Favour> createState() => _FavourState();
}

class _FavourState extends State<Favour> {
  
  int currentindex =0;
   void Ensuresafe(){
    print("List Empty");
   if(widget.sent==null){
    setState(() {
      widget.sent.add("Your List is Empty");
    });
   }
  }
  void Touched() {
    if(currentindex == (widget.sent.length-1)) {
      currentindex=widget.sent.length-1;
    }
    else{
    setState(() {
      currentindex++;
    });}
  }

  void Toucheddown() {
    if(currentindex == 0) {
      currentindex=0;
    }
    else{
    setState(() {
      currentindex--;
    });}
  }
 
@override
void initState(){
  WidgetsFlutterBinding.ensureInitialized();
  Ensuresafe;
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Favorites"),toolbarHeight: 40,backgroundColor: Colors.orange,),
        body: Swipe(
          onSwipeUp: Touched,
          onSwipeDown: Toucheddown,
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                )
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Text(
                    widget.sent[currentindex],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),)),
        ),
      ),
    );
  }
}