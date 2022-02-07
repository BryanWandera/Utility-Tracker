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
import 'package:firebase_core/firebase_core.dart';
import 'package:very_cool_app/utilities/firestore.dart';
import 'package:provider/provider.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: veryDarkBlue, // navigation bar color
    statusBarColor: veryDarkBlue, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>HomeScreenProvider()
        )
      ],
      child: MaterialApp(
        title: 'Utility Tracker',
        initialRoute: 'screens/Home.dart',
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
      ),
    );
  }
}

