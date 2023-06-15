import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';
import'package:hive_flutter/hive_flutter.dart';
import 'package:animated_background/animated_background.dart';
class Favour extends StatefulWidget {
  // const Favour({super.key});

Favour({Key? mykey}):super(key:mykey);
  @override
  State<Favour> createState() => _FavourState();
}

class _FavourState extends State<Favour>with TickerProviderStateMixin  {
  late List<String> newlist ;
  final _mybox = Hive.box('testBox');
  int currentindex =0;
   void Ensuresafe(){
    print("List Empty");
   if(_mybox.get(456)!=null){
      
      _mybox.get(456).add("Your list is empty");
      
    
   }
  }
  void Touched() {
     
    if(currentindex == (_mybox.get(456).length-1)) {
      currentindex=_mybox.get(456).length-1;
    }
    else{
      print(_mybox.get(456));
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
  // WidgetsFlutterBinding.ensureInitialized();
 print("InitState");
  if(_mybox.get(456)!=null){
     print("InitState222");
     print(_mybox.get(456)[0]);
     setState(() {
       newlist=List.from(_mybox.get(456));
     });
     
    _mybox.put(456, newlist);
      print(_mybox.get(456));
   
  }else {

    Navigator.pop(context);

  }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Favorites"),toolbarHeight: 35,backgroundColor: Colors.black),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
  
        ),
        vsync: this,
        child: Stack(
         
         children: [
           Stack(
             
             children: [
               Center(
                 child: Padding(
                   padding: const EdgeInsets.only(left:30.0),
                   child: Text(
                    newlist[currentindex],
                     style: TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(40.0),
                 child: Align(
                   alignment: Alignment.topRight,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Container(
                 
                       width: 55,
                       height: 65,
                       
                       decoration: BoxDecoration(
                         color: Colors.grey,
                         borderRadius: BorderRadius.all(
                           Radius.circular(20)
                         ),
                         border: Border.all(
                           width: 2,
                           color: Colors.grey,
                         )
                       ),
                       child: IconButton(onPressed: (){
                         
                           _mybox.get(456).removeWhere((item)=>item==_mybox.get(80)[currentindex]);
                       
                         
                         newlist.addAll(_mybox.get(456));
                         
                           _mybox.put(456, newlist);
                       
                         print("remove pressed");
                         print(newlist);
                       }, icon: Icon(Icons.delete,color: Colors.black,size: 35,))),
                   ],
                   ),
                 ),
               ),
      
                ],
           ),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Padding(

                   padding: const EdgeInsets.only(bottom:15.0),
                   child: Container(
                     width: 180,
                     height: 90,
                     decoration: BoxDecoration(
                       color: Colors.grey[800],
                       borderRadius: BorderRadius.all(
                         Radius.circular(30)
                       )
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(left:30.0,bottom: 15),
                       child: 
                       Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        ElevatedButton(
          onPressed: () {
           Touched();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Toucheddown();
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
          ),
        ),
            ],
          ),
                     ),
                   ),
                 ),
               )
      //                        Positioned(
      //   bottom: 40,
      //   left: 0,
      //   right: 0,
      //   child: FractionalTranslation(
      //     translation: const Offset(0, 1),
      //     child: Container(
      //       width: 100,
      //       height: 60,
      //       decoration: BoxDecoration(
      //         color: Colors.grey[800],
      //         borderRadius: BorderRadius.all(Radius.circular(30))
      //       ),
      //       child: Center(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             IconButton(
      //               color: Colors.white,
      //               padding: const EdgeInsets.only(right: 20.0),
      //               focusColor: Colors.blue,
      //               highlightColor: Colors.blue,
      //               hoverColor: Colors.blue,
      //               splashColor: Colors.blue,
      //               onPressed: Toucheddown,
      //               icon: Icon(Icons.arrow_back_ios_new_outlined, size: 50)
      //             ),
      //             IconButton(
      //               color: Colors.white,
      //               padding: const EdgeInsets.only(left: 20.0),
      //               onPressed: Touched,
      //               icon: Icon(Icons.arrow_forward_ios_outlined, size: 50)
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      
            
         ],
                ),
      ),);
     
  }
}