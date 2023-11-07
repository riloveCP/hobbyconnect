import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:hobbyconnect/Splash.dart';
import 'package:hobbyconnect/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'android project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(28, 152, 237, 1.0)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('images/hocologo.png', height: 10000, width: 10000),
        duration: 2000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,nextScreen: LoginPage(title: 'Hobby Connect'), 
      )
    );
  }
} //class


