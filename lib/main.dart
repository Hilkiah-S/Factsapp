import 'package:flutter/material.dart';
import'package:factsapp/home.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:factsapp/modal/genral.dart';
import 'package:factsapp/modal/general.dart';
import'package:factsapp/excel.dart';
import 'package:factsapp/database.dart';
import'package:hive_flutter/hive_flutter.dart';

void main()async {
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');

    
    
  runApp(MaterialApp (
    debugShowCheckedModeBanner: false,
    home:MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}