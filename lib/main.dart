import 'package:flutter/material.dart';
import 'package:very_cool_app/custom-widgets/addUtilityButton.dart';
import 'package:very_cool_app/screens/AddBillScreen.dart';
import 'package:very_cool_app/screens/AddUtilityScreen.dart';
import 'package:very_cool_app/screens/Home.dart';
import 'package:very_cool_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:very_cool_app/screens/HomesScreen.dart';
import 'package:very_cool_app/screens/TipsScreen.dart';
import 'package:very_cool_app/screens/UpcomingBillsScreen.dart';
import 'package:very_cool_app/screens/PastTransactionsScreen.dart';

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
      initialRoute: 'screens/AddUtilityScreen.dart',
      routes: {
        'screens/Home.dart': (context) => MyHomePage(),
        'screens/HomesScreen.dart': (context) => HomesScreen(),
        'screens/AddUtilityScreen.dart': (context)=> AddUtilityScreen(),
        'screens/AddBillScreen.dart': (context) => AddBillScreen(),
        'screens/UpcomingBillsScreen.dart' : (context) => UpcomingBillsScreen(),
        'screens/PastTransactionsScreen.dart' : (context) => PastTransactionsScreen(),
        'screens/TipsScreen.dart': (context) => TipsScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

