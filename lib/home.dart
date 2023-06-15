import 'dart:ui';

import 'package:factsapp/modal/amahric.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:swipe/swipe.dart';
import 'package:factsapp/generalsetting.dart';
import 'package:factsapp/categories.dart';
import 'package:factsapp/background.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:factsapp/favorites.dart';
import 'package:factsapp/database.dart';
import'package:hive_flutter/hive_flutter.dart';
import 'package:factsapp/main.dart';
import 'package:factsapp/database.dart';
import'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


class Home extends StatefulWidget {
  // const Home({super.key});
  var wall;
  var select;
  Home({Key? mykey, this.wall,this.select}) : super(key: mykey);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color> navcolor=[Colors.black,Colors.red,Colors.blueAccent,Colors.greenAccent];
  
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  final _mybox = Hive.box('testbox');
  // _mybox.put(1, back);
  bool dataLoading = true;
  List<String?> general = [];
  List<String?> lifeHack = [];
  List<String?> animals = [];
  List<String?> sport = [];
  List<String?> science = [];
  List<String?> sex = [];
  List<String?> humanBiology = [];
  List<String?> universe = [];
   List<String?> filled = [];
  bool favoritebool = false;
  late List<Amharic> amharic;
  String back="";
 late List favoritechangable;
Ensuresafe(){
  if(favorites.length==0){
    favorites.add("Your list is empty");
  }
}
  void Touched() {
    if(currentSwipeIndex == filled.length-1) {
      
      currentSwipeIndex=filled.length-1;
      _mybox.put(40,currentSwipeIndex);
     
    }
    else{
    setState(() {
      currentSwipeIndex++;
      
    });
     setState((){
        xq=changeicon;
      });
     _mybox.put(40, currentSwipeIndex);
    }
    // box.put('DB',Database(name:"Abebe",currentIndex: currentSwipeIndex,favoritedb: ["THis was put","2ndsession"]));
  }

  void Toucheddown() {
    if(currentSwipeIndex == 0) {
      currentSwipeIndex=0;
      _mybox.put(40, currentSwipeIndex);
    }
    else{
       setState((){
        xq=changeicon;
      });
    setState(() {
      currentSwipeIndex--;
    });
     _mybox.put(40, currentSwipeIndex);
    }
  }

  Icon changeicon = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.white,
    size: 25
    
  );
  Icon xq = const Icon(
    Icons.favorite,
    color: Colors.white,
    size: 25,
  );
  Icon changeiconshare = const Icon(
    Icons.share,
    color: Colors.white,
    size: 25,
  );
  Icon changediconshare = const Icon(
    Icons.share,
    color: Colors.blue,
    size: 25,
  );
  var b = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.white,
    size: 25,
  );
  Icon changedicon = const Icon(Icons.favorite, color: Colors.red, size: 25);
 
  List favorites= [];
List favorateschangable=[];
bool clicked=false;
bool value = true;
bool option = true;
String background="";
Future _readExcelOromo(value) async {
  value=false;
  print("Oromo language");
    var file = 'assets/data.xlsx';
    ByteData data = await rootBundle.load(file);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    Sheet amharic = excel.tables["Amharic"]!;
    Sheet oromo = excel.tables["Oromo"]!;
    Sheet selectedSheet = oromo;
  filled.clear();
  general.clear();
  lifeHack.clear();
  animals.clear();
  sport.clear();
  science.clear();
  sex.clear();
  humanBiology.clear();
  universe.clear();
  
    for (var i = 0; i < selectedSheet.maxRows; i++) {
      if(i == 0) continue;
      general.add(selectedSheet.rows[i][0]?.value.toString());
      lifeHack.add(selectedSheet.rows[i][1]?.value.toString());
      animals.add(selectedSheet.rows[i][2]?.value.toString());
      sport.add(selectedSheet.rows[i][4]?.value.toString());
      science.add(selectedSheet.rows[i][3]?.value.toString());
      sex.add(selectedSheet.rows[i][5]?.value.toString());
      humanBiology.add(selectedSheet.rows[i][6]?.value.toString());
      universe.add(selectedSheet.rows[i][7]?.value.toString());
    }
    dataLoading = false;
    calledtofill();
    print('General List $sex');
    setState(() {});
  }


writeintodb(a){
_mybox.put(2,a);
}

List <List>tobedispayed=[];
addtobedisplayed(valuebg){
tobedispayed.add(valuebg);
}
removefromtobedisplayed(){

}
Future _readExcel(value) async {
  value=true;
     print("Amharic Language");
    var file = 'assets/data.xlsx';
    ByteData data = await rootBundle.load(file);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    Sheet amharic = excel.tables["Amharic"]!;
    Sheet oromo = excel.tables["Oromo"]!;
    // Sheet selectedSheet = value ? amharic : oromo;
Sheet selectedSheet=amharic;
 filled.clear(); 
 general.clear();
  lifeHack.clear();
  animals.clear();
  sport.clear();
  science.clear();
  sex.clear();
  humanBiology.clear();
  universe.clear();
    for (var i = 0; i < selectedSheet.maxRows; i++) {
      if(i == 0) continue;
      general.add(selectedSheet.rows[i][0]?.value.toString());
      lifeHack.add(selectedSheet.rows[i][1]?.value.toString());
      animals.add(selectedSheet.rows[i][2]?.value.toString());
      sport.add(selectedSheet.rows[i][3]?.value.toString());
      science.add(selectedSheet.rows[i][4]?.value.toString());
      sex.add(selectedSheet.rows[i][5]?.value.toString());
      humanBiology.add(selectedSheet.rows[i][6]?.value.toString());
      universe.add(selectedSheet.rows[i][7]?.value.toString());
    }
 
       dataLoading = false;
       calledtofill();
    print('General List $general');
    setState(() {});
    _mybox.put(80, general);
  }
  // _mybox.g
  void calledtofill(){
    if (widget.select != null) {
      filled.clear();
      if(widget.select==1){
        filled.addAll(general);
      }
      if(widget.select==2){
        filled.addAll(universe);
      }
      if(widget.select==3){
        filled.addAll(sport);
      }
      if(widget.select==4){
        filled.addAll(animals);
      }
      if(widget.select==5){
        filled.addAll(science);
      }
      if(widget.select==6){
        filled.addAll(humanBiology);
      }
      if(widget.select==7){
        filled.addAll(lifeHack);
      }
      if(widget.select==8){
        filled.addAll(sex);
      }
      
      
    } else {
      filled.addAll(general);
      
      
    }
    
  }
  late List selected;


late bool gatefav;
  @override
  void initState() {
  _readExcel(value);

  super.initState();
  if( _mybox.get(456)==null){print("EMPTY ENTERED");
      setState(() {
        gatefav=false;
        favoritechangable=[];
      });

  }
  else if( _mybox.get(456)!=null){
    print("NOT EMPTY ENTERED");
    setState(() {
       favoritechangable=_mybox.get(456);
    });
 
    print(_mybox.get(456));
    print(favorateschangable);
    
    setState(() {
      gatefav=true;
    });
  }
 
 
    
    if(_mybox.get(40)!=null){
      setState(() {
        currentSwipeIndex=_mybox.get(40);
      });
    }

    if (widget.wall != null) {
      back = widget.wall;
      _mybox.put(1,back);
      background = _mybox.get(1);
    } else if(_mybox.get(1)!=null){
      
      background = _mybox.get(1);
    }
    else{
      back = "wallsix.jpg";
      _mybox.put(1,back);
       background = _mybox.get(1);
    }

    
   
    
    
    
  }

  int currentSwipeIndex = 0;
  bool again = true;
  Future<bool> noreturn ()async{
    return false;
  }
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: dataLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : GestureDetector(
            onVerticalDragEnd: (DragEndDetails details) {
              if(details.primaryVelocity! > 0){
                   Toucheddown();
              }
              if(details.primaryVelocity! <0){
                   Touched();
              }
              
            },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/$background"), fit: BoxFit.cover),
                ),
                child: Container(
                  width: 600,
                  height: 500,
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(
                        top:50.0,
                        left:200.0,
                        child: Column(
                          children: [
                            Text("Amharic/Afaan Oromo",style: TextStyle(color:Colors.white),),
                            Switch(value: option,
                            activeColor: Colors.grey,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: Colors.grey,
                             onChanged: (Changed)async{setState(() {
                              option=Changed;
                              value=!value;
                              
                            });
                            print(value);
                            if(value==true){
                              await _readExcel(value);
                            }
                            else if(value==false){
                              await _readExcelOromo(value);
                            }
                            
                            })
                          ],
                        ),
                      ),
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: AnimatedSwitcher(
                               duration: Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                      opacity: animation,
                             child: child,
                           );
                             },
                              child: Text(
                                                        '${filled[currentSwipeIndex]}',
                                                         key: ValueKey<int>(currentSwipeIndex),
                                                        style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                                                      ),
                            ),
                          )),
                      const SizedBox(
                        height: 60,
                      ),
                      Align(alignment: Alignment.bottomCenter,
                      child:Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch(index){
                case 0:
                  
                                        print("Modal is pressed");
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: double.infinity,
                                                height: 250,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(255, 250, 245, 245),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25),
                                                          topRight:
                                                              Radius.circular(
                                                                  25)),
                                                ),
                                                child:Column(
                                                  children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:10.0,left: 10.0,right: 10.0,bottom: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // specify the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70), // specify the border radius
            ),
            minimumSize: Size(330,60), 
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          
          onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Category()));
          },
          icon: Icon(Icons.category,color: Colors.purpleAccent,size: 30,), // specify the prefix icon
          label: Text('Category',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          ),
          
                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top:5.0,left: 10.0,right: 10.0,bottom: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // specify the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70), // specify the border radius
            ),
            minimumSize: Size(330,60), 
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          
          onPressed: gatefav? () {
            Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Favour()));
          }:null,
          icon: Icon(Icons.favorite,color: Colors.red,size: 30,), // specify the prefix icon
          label: Text('Favorite',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          ),
          
                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(top:5.0,left: 10.0,right: 10.0,bottom: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // specify the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70), // specify the border radius
            ),
            minimumSize: Size(330,60), 
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          
          onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Background()));
          
          },
          icon: Icon(Icons.ac_unit,color: Colors.black,size: 30,), // specify the prefix icon
          label: Text('Background',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          ),
          
                                                      ],
                                                    ),
                                                  ),
                                ]   ));
                                      });
                                      
                break;
                case 1: print("heart pressed");
                                        setState(() {
                                          gatefav=true;
                                          if (favoritebool == true) {
                                          setState(() {
                                            xq = changeicon;
                                             favoritebool = false;
                                          });
                                            favoritechangable.add(filled[
                                              currentSwipeIndex
                                            ]);
                                            print(favoritechangable);
                                            
                                              
                                              
                                            _mybox.put(456,favoritechangable);
                                          } else {
                                            setState(() {
                                                xq = changedicon;
                                            });
                                          
                                            favoritebool = true;
                                            
                                           
                                          
                                          }
                                        });
                                        break;
                case 2: print(_mybox.get(2));
                                          Share.share(filled[currentSwipeIndex]!);break;
              }
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: navcolor[index],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex
                      ? navcolor[index]
                      : Colors.black38,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
                      ),
          //             Align(
          //               alignment:Alignment.bottomCenter,
          //               // bottom:65.0,
          //               // left:31.0,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(10.0),
          //                 child: Container(
          //                   height:55,
          //                   width:300,
          //                   decoration: BoxDecoration(
          //                     color:Colors.black,
          //                     borderRadius: BorderRadius.all(
          //                       Radius.circular(20),
          //                     ),
          //                   ),
          //                   child: Center(
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         IconButton(
          //                             onPressed: () {
          //                               print("This is pressed");
          //                               setState(() {
          //                                 gatefav=true;
          //                                 if (favoritebool == true) {
          //                                 setState(() {
          //                                   xq = changeicon;
          //                                    favoritebool = false;
          //                                 });
          //                                   favoritechangable.add(filled[
          //                                     currentSwipeIndex
          //                                   ]);
          //                                   print(favoritechangable);
                                            
                                              
                                              
          //                                   _mybox.put(456,favoritechangable);
          //                                 } else {
          //                                   setState(() {
          //                                       xq = changedicon;
          //                                   });
                                          
          //                                   favoritebool = true;
                                            
                                           
                                          
          //                                 }
          //                               });
          //                             },
          //                             icon: xq),
          //                         Padding(
          //                           padding: const EdgeInsets.all(5.0),
                                  
          //                               child: IconButton(
          //                               onPressed: () {
          //                                 print(_mybox.get(2));
          //                                 Share.share(filled[currentSwipeIndex]!);
          //                                 setState(() {
          //                                   // changeiconshare = changediconshare;
          //                                 });
          //                               },
          //                               icon: changeiconshare),
          //                         ),
          //                         IconButton(
          //                             icon: const Icon(
          //                               Icons.settings,
          //                               size: 25,
          //                               color: Colors.white,
          //                             ),
          //                             onPressed: () {
          //                               showModalBottomSheet(
          //                                   context: context,
          //                                   builder: (BuildContext context) {
          //                                     return Container(
          //                                       width: double.infinity,
          //                                       height: 250,
          //                                       decoration: const BoxDecoration(
          //                                         color: Color.fromARGB(255, 250, 245, 245),
          //                                         borderRadius:
          //                                             BorderRadius.only(
          //                                                 topLeft:
          //                                                     Radius.circular(
          //                                                         25),
          //                                                 topRight:
          //                                                     Radius.circular(
          //                                                         25)),
          //                                       ),
          //                                       child:Column(
          //                                         children: [
          //                                         Padding(
          //                                           padding: const EdgeInsets.only(top:10.0,left: 10.0,right: 10.0,bottom: 5),
          //                                           child: Row(
          //                                             mainAxisAlignment: MainAxisAlignment.center,
          //                                             children: [
          //                                               ElevatedButton.icon(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.white, // specify the background color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(70), // specify the border radius
          //   ),
          //   minimumSize: Size(330,60), 
          //   side: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          
          // onPressed: () {
          //   Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Category()));
          // },
          // icon: Icon(Icons.category,color: Colors.purpleAccent,size: 30,), // specify the prefix icon
          // label: Text('Category',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          // ),
          
          //                                             ],
          //                                           ),
          //                                         ),
          //                                          Padding(
          //                                           padding: const EdgeInsets.only(top:5.0,left: 10.0,right: 10.0,bottom: 5),
          //                                           child: Row(
          //                                             mainAxisAlignment: MainAxisAlignment.center,
          //                                             children: [
          //                                               ElevatedButton.icon(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.white, // specify the background color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(70), // specify the border radius
          //   ),
          //   minimumSize: Size(330,60), 
          //   side: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          
          // onPressed: gatefav? () {
          //   Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Favour()));
          // }:null,
          // icon: Icon(Icons.favorite,color: Colors.red,size: 30,), // specify the prefix icon
          // label: Text('Favorite',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          // ),
          
          //                                             ],
          //                                           ),
          //                                         ),
          //                                          Padding(
          //                                            padding: const EdgeInsets.only(top:5.0,left: 10.0,right: 10.0,bottom: 5),
          //                                           child: Row(
          //                                             mainAxisAlignment: MainAxisAlignment.center,
          //                                             children: [
          //                                               ElevatedButton.icon(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.white, // specify the background color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(70), // specify the border radius
          //   ),
          //   minimumSize: Size(330,60), 
          //   side: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          
          // onPressed: () {
          //   Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Background()));
          
          // },
          // icon: Icon(Icons.ac_unit,color: Colors.black,size: 30,), // specify the prefix icon
          // label: Text('Background',style: TextStyle(color: Colors.grey,fontSize: 20),), // specify the button label
          // ),
          
          //                                             ],
          //                                           ),
          //                                         ),
          //                       ]   ));
          //                             });
          //                                   })]))),
          //               )),
                                          
                                          
                                          ])))));
                                  
  
  }
  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Either username or password is incorrect'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              
              Icon(Icons.error,color: Colors.red,size: 120,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Try again'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  List<IconData> listOfIcons = [
    Icons.menu,
    Icons.favorite_rounded,
    Icons.share_outlined,
    Icons.camera_alt_outlined,
    
  ];
}
