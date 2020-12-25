import 'dart:async';
import 'package:FMB/Screens/Login/sign_in/signin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => SignInPage(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.red),
          brightness: Brightness.dark),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/loading.gif'), fit: BoxFit.contain),
    ));
  }
}
