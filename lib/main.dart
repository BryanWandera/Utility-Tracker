import 'package:flutter/material.dart';
import 'package:very_cool_app/screens/Home.dart';
import 'package:very_cool_app/constants.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: veryDarkBlue, // navigation bar color
    statusBarColor: veryDarkBlue, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utility Tracker',
      initialRoute: 'screens/Home.dart',
      routes: {
        'screens/Home.dart': (context) => MyHomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

