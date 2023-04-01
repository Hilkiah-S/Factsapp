import 'dart:ui';

import 'package:factsapp/modal/amahric.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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


class Home extends StatefulWidget {
  // const Home({super.key});
  var wall;
  var select;
  Home({Key? mykey, this.wall,this.select}) : super(key: mykey);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//   Future<void> readExcelFile() async {
//
//   final file = await File('store/oromo.xlsx').readAsBytes();

//
//   final excel = Excel.decodeBytes(file);

//
//   final sheet = excel.tables['Sheet1'];

//
//   final data = Map<String, List<String>>();

//
//   for (final column in sheet.columns) {
//
//     final label = column[0].value.toString();

//
//     final columnData = column.skip(1).map((cell) => cell.value.toString()).toList();

//
//     data[label] = columnData;
//   }

//   print(data);
// }
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
  bool favoritebool = false;

  late List<Amharic> amharic;
  String back="";

  
  void Touched() {
    if(currentSwipeIndex == selected.length) {
      currentSwipeIndex=selected.length;
    }
    else{
    setState(() {
      currentSwipeIndex++;
      
    });
    _mybox.put(34,currentSwipeIndex);
    }
    // box.put('DB',Database(name:"Abebe",currentIndex: currentSwipeIndex,favoritedb: ["THis was put","2ndsession"]));
  }

  void Toucheddown() {
    if(currentSwipeIndex == 0) {
      currentSwipeIndex=0;
    }
    else{
    setState(() {
      currentSwipeIndex--;
    });
    _mybox.put(34, currentSwipeIndex);
    }
  }

  Icon changeicon = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.white,
    size: 40,
  );
  Icon xq = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.white,
    size: 40,
  );
  Icon changeiconshare = const Icon(
    Icons.share,
    color: Colors.white,
    size: 40,
  );
  Icon changediconshare = const Icon(
    Icons.share,
    color: Colors.blue,
    size: 40,
  );
  var b = const Icon(
    Icons.favorite_border_outlined,
    color: Colors.white,
    size: 40,
  );
  Icon changedicon = const Icon(Icons.favorite, color: Colors.red, size: 40);
 
  List favorites= [];
  Map<String, dynamic> mainmap = {};
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
  selected.clear();
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
    print('General List $general');
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
 selected.clear(); 
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
     
    print('General List $general');
    setState(() {});
  }
  // _mybox.g
  dynamic selected;
  @override
  void initState() {
    // Database one = box.get('Db');
  // print(one.favoritedb);
  // addtobedisplayed(valuebg);
  _readExcel(value);
  super.initState();
    // readExcelFile();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 20,
        channelKey: 'basic_channel',
        title: "ይህን ያውቃሉ?",
        body: "ደስተኛ ስንሆን የምንፈልገው እንቅልፍ ይቀንሳል",
      ),
      schedule: NotificationCalendar(
                 hour: 9,
                 minute: 57,
                 second: 10,
                 repeats: true,
                   )
    );
    
  
    if (widget.wall != null) {
      back = widget.wall;
      _mybox.put(1,back);
      background = _mybox.get(1);
    } else {
      back = "wallsix.jpg";
      // _mybox.put(1,back);
      background = _mybox.get(1);
    }

    if (widget.select != null) {
      selected = widget.select;
      _mybox.put(33,selected);
      selected = _mybox.get(33);
    } else {
      _mybox.put(33,"general");
      selected =  _mybox.get(33);
      // _mybox.put(1,back);
      // background = _mybox.get(1);
    }
    
    mainmap = {};
    // 'text':displayedtext[a],'icons':Container(child:Text("Display")),'number':a};
    
    
  }

  int currentSwipeIndex = 0;
  bool again = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Swipe(
              onSwipeUp: Touched,
              onSwipeDown: Toucheddown,
              onSwipeRight: Touched,
              onSwipeLeft: Toucheddown,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/New/$background"), fit: BoxFit.cover),
                ),
                child: Swipe(
                  onSwipeUp: Touched,
                  onSwipeDown: Toucheddown,
                  onSwipeRight: Touched,
              onSwipeLeft: Toucheddown,
                  child: Container(
                    width: 600,
                    height: 500,
                    child: Swipe(
                      onSwipeUp: Touched,
                      onSwipeDown: Toucheddown,
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            top:50.0,
                            left:200.0,
                            child: Column(
                              children: [
                                Text("Amharic/Afaan Oromo",style: TextStyle(color:Colors.white),),
                                Switch(value: option, onChanged: (Changed)async{setState(() {
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
                                child: Text(
                            '${selected[currentSwipeIndex]}',
                            style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                          ),
                              )),
                          const SizedBox(
                            height: 60,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('${mainlist[a]}'),
                          //   ],
                          // ),
                          Positioned(
                            bottom:70.0,
                            left:90.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        
                                        setState(() {
                                          // if(again=true){
                          
                                          //   changeicon=changedicon;
                                          //   again=false;
                                          //   }
                                          //   if(again=false){
                                          //    changeicon=b;
                          
                                          //   }
                                          if (favoritebool == true) {
                                            xq = changeicon;
                                            favoritebool = false;
                                            favorites.remove(selected[currentSwipeIndex]);
                                            // box!.put('DB',Database(name:"Abebe",currentIndex: 0,favoritedb: favorites));
                                            print(favorites);
                                          } else {
                                            xq = changedicon;
                                            favoritebool = true;
                                            
                                            favorites.add(selected[currentSwipeIndex]);
                                            print(favorites);
                                            writeintodb(selected[currentSwipeIndex]);
                                          }
                                        });
                                      },
                                      icon: xq),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                  
                                        child: IconButton(
                                        onPressed: () {
                                          print(_mybox.get(2));
                                          Share.share(selected[currentSwipeIndex]!);
                                          setState(() {
                                            changeiconshare = changediconshare;
                                          });
                                        },
                                        icon: changeiconshare),
                                  ),
                                  IconButton(
                                      icon: const Icon(
                                        Icons.settings,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  width: 500,
                                                  height: 600,
                                                  decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 247, 245, 245),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    25),
                                                            topRight:
                                                                Radius.circular(
                                                                    25)),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const Settings()));
                                                              },
                                                              child: Container(
                                                                width: 300,
                                                                height: 100,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                15),
                                                                    boxShadow: <
                                                                        BoxShadow>[
                                                                      const BoxShadow(
                                                                        color: Colors
                                                                            .black54,
                                                                        blurRadius:
                                                                            15.0,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            0.75),
                                                                      )
                                                                    ]),
                                                                child:
                                                                    const ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .settings,
                                                                    color: Colors
                                                                        .purple,
                                                                    size: 50,
                                                                  ),
                                                                  title: Text(
                                                                    "General Settings",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            65,
                                                                            64,
                                                                            64),
                                                                        fontSize:
                                                                            30),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const Category())),
                                                              },
                                                              child: Container(
                                                                width: 300,
                                                                height: 100,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                15),
                                                                    boxShadow: <
                                                                        BoxShadow>[
                                                                      const BoxShadow(
                                                                        color: Colors
                                                                            .black54,
                                                                        blurRadius:
                                                                            10.0,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            0.75),
                                                                      )
                                                                    ]),
                                                                child:
                                                                    const ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .category,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            77,
                                                                            216,
                                                                            226),
                                                                    size: 50,
                                                                  ),
                                                                  title: Text(
                                                                    "Catagories",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            65,
                                                                            64,
                                                                            64),
                                                                        fontSize:
                                                                            30),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Favour(sent:favorites)));
                                                              },
                                                              child: Container(
                                                                width: 300,
                                                                height: 100,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                9),
                                                                    boxShadow: <
                                                                        BoxShadow>[
                                                                      const BoxShadow(
                                                                        color: Colors
                                                                            .black54,
                                                                        blurRadius:
                                                                            10.0,
                                                                        offset:
                                                                            Offset(
                                                                                0.0,
                                                                                0.75),
                                                                      )
                                                                    ]),
                                                                alignment: Alignment
                                                                    .center,
                                                                child:
                                                                    const ListTile(
                                                                  leading: Icon(
                                                                    Icons.favorite,
                                                                    color: Colors
                                                                        .orange,
                                                                    size: 50,
                                                                  ),
                                                                  title: Text(
                                                                    "Favorites",
                                                                    style: TextStyle(
                                                                        color: Color
                                                                            .fromARGB(
                                                                                255,
                                                                                65,
                                                                                64,
                                                                                64),
                                                                        fontSize:
                                                                            30),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Background()));
                                                              },
                                                              child: Container(
                                                                width: 300,
                                                                height: 100,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                9),
                                                                    boxShadow: <
                                                                        BoxShadow>[
                                                                      const BoxShadow(
                                                                        color: Colors
                                                                            .black54,
                                                                        blurRadius:
                                                                            10.0,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            0.75),
                                                                      )
                                                                    ]),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const ListTile(
                                                                  leading: Icon(
                                                                    Icons.ac_unit,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            104,
                                                                            102,
                                                                            99),
                                                                    size: 50,
                                                                  ),
                                                                  title: Text(
                                                                    "Background",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            65,
                                                                            64,
                                                                            64),
                                                                        fontSize:
                                                                            30),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
