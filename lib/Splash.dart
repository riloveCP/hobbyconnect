import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
  //_SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
 void initState(){
  super.initState();
  //_navigatetologin();
 }

 _navigatetologin() async{
  await Future.delayed(Duration(milliseconds: 2000), () {} );
  Navigator.pushReplacement(
    context, 
    MaterialPageRoute(
      builder: (context) => LoginPage(
        title: 'Hobby Connect',
        )));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200, 
              width: 200, 
              color: Colors.blue,
              ),
            Container(
              child: Text('Hobby Connect')
            ),

          ],
        ),
      )
    );
  }
}