import 'package:flutter/material.dart';
import'package:factsapp/home.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Facts of the Day',
        channelDescription: 'Shows interesting Facts'
      ),
    ],
  );
  runApp(MaterialApp (
    debugShowCheckedModeBanner: false,
    home:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}