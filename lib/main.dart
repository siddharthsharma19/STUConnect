import 'package:flutter/material.dart';
import 'package:ritstudent/screens/welcome/welcome_screen.dart';
import 'package:ritstudent/theme.dart';

var usertoken;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
// SharedPreferences sp = await SharedPreferences.getInstance();
// await sp.clear();
// email = sp.getString('email');
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RIT Student',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // home: email == null ? WelcomeScreen() : MainScreen(),
      home: WelcomeScreen(),
    );
  }
}
