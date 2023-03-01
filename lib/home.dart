import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipe/swipe.dart';
import'package:factsapp/generalsetting.dart';
import 'package:factsapp/categories.dart';
import 'package:factsapp/background.dart';
class Home extends StatefulWidget {
  // const Home({super.key});
  var wall;
Home({Key? mykey,this.wall}):super(key:mykey); 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String back="galaxy.jpg";
  void Touched(){
    setState(() {
      a++;
    });
  }
  void Toucheddown(){
    setState(() {
      a--;
    });
  }
  Icon changeicon = Icon(Icons.favorite_border_outlined,color: Colors.black,size:40,);
  Icon changeiconshare = Icon(Icons.share,color: Colors.black,size:40,);
   Icon changediconshare = Icon(Icons.share,color: Colors.blue,size:40,);
  var b = Icon(Icons.favorite_border_outlined,color: Colors.black,size:40,);
   Icon changedicon = Icon(Icons.favorite,color:Colors.red,size:40);
  List displayedtext=["APPLE","MANGO","BANANA","GRAPES","BERRY","MILK","BUTTER"];
Map <String,dynamic>mainmap = {};
 @override
 void initState(){
  if(widget.wall!=null){
  back=widget.wall;
  }else{
    back="galaxy.jpg";
  }
  mainmap = {};
    // 'text':displayedtext[a],'icons':Container(child:Text("Display")),'number':a};
    for(int y=0;y<displayedtext.length;y++){
      mainmap['text']=displayedtext[y];
      mainmap['favicon']=changeicon;
      mainmap['shareicon']=changeiconshare;
    }
  List <Map> mainlist=[for(int i=0;i<displayedtext.length;i++)mainmap];
  print(mainlist);
 }
  
  
  int a=0;
  bool again = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swipe(
        onSwipeUp: Touched,
        onSwipeDown: Toucheddown,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/$back"),fit: BoxFit.cover),
                      ),
          child: Container(
            width: 600,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(mainmap['text'],style: TextStyle(fontSize: 80,color: Colors.white),)),
                SizedBox(height: 60,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('${mainlist[a]}'),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){setState(() {
                      
                    if(again=true){
                      
                      changeicon=changedicon;
                      again=false;
                      }
                      if(again=false){
                       changeicon=b;
                       
                      }
                    });}, icon: mainmap['favicon']),
                    IconButton(onPressed: (){setState(() {
                      changeiconshare=changediconshare;
                    });}, icon: mainmap['shareicon']),
                    IconButton(icon:Icon(Icons.settings,size: 40,) ,onPressed:(){
                      showModalBottomSheet(context: context, builder:(BuildContext context){
                        return SingleChildScrollView(
                          child: Container(
                            width: 500,
                            height: 600,
                            decoration: BoxDecoration(
                              color:Color.fromARGB(255, 247, 245, 245),
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                                      },
                                      child: Container(
                                        width: 300,
                                        height:100,
                                       margin: EdgeInsets.all(10),
                                                                    padding: EdgeInsets.all(10),
                                       
                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color:Colors.black54,
                                            blurRadius: 15.0,
                                            offset:Offset(0.0,0.75),
                                          )
                                        ]),
                                        child: ListTile(
                                          leading:Icon(Icons.settings,color: Colors.purple,size: 50,),
                                          title: Text("General Settings",style: TextStyle(color:Color.fromARGB(255, 65, 64, 64),fontSize: 30),),
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
                                      onTap: () => {
                                        Navigator.push(context,MaterialPageRoute(builder:(context)=>Category())),
                                      },
                                      child: Container(
                                         width: 300,
                                        height:100,
                                        margin: EdgeInsets.all(10),
                                                                    padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(15),boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color:Colors.black54,
                                            blurRadius: 10.0,
                                            offset:Offset(0.0,0.75),
                                          )
                                        ]),
                                        child: ListTile(
                                                        leading:Icon(Icons.category,color:Color.fromARGB(255, 77, 216, 226),size: 50,),
                                                        title: Text("Catagories",style: TextStyle(color:Color.fromARGB(255, 65, 64, 64),fontSize: 30),),
                                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                       width: 300,
                                      height:100,
                                      margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(9),boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color:Colors.black54,
                                          blurRadius: 10.0,
                                          offset:Offset(0.0,0.75),
                                        )
                                      ]),
                                      alignment: Alignment.center,
                                      child: ListTile(
                                        leading:Icon(Icons.favorite,color: Colors.orange,size: 50,),
                                        title: Text("Favorites",style: TextStyle(color:Color.fromARGB(255, 65, 64, 64),fontSize: 30),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Background()));
                                      },
                                      child: Container(
                                         width: 300,
                                        height:100,
                                        margin: EdgeInsets.all(10),
                                                                    padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(9),boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color:Colors.black54,
                                            blurRadius: 10.0,
                                            offset:Offset(0.0,0.75),
                                          )
                                        ]),
                                        alignment: Alignment.center,
                                        child: ListTile(
                                          leading:Icon(Icons.ac_unit,color: Color.fromARGB(255, 104, 102, 99),size: 50,),
                                          title: Text("Background",style: TextStyle(color:Color.fromARGB(255, 65, 64, 64),fontSize: 30),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],),
                          ),
                        );} );
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}