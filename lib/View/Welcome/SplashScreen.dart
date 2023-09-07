import 'package:flutter/material.dart';
import 'package:closecallsecommerce/View/UserAccess/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Main/Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late SharedPreferences prefer;
  bool isLoggedIn=false;

  @override
  void initState() {
    super.initState();
    _getSharedPreferences();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Animation duration
    );

    // Start the animation
    _animationController.forward();

    // Set a timer for the splash screen duration
    sendtonextscreen();






  }
  _getSharedPreferences() async {
    prefer = await SharedPreferences.getInstance();
    // Do something with prefs if needed
    isLoggedIn=prefer.getBool('isLoggedIn')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animationController,
          child: Container(
              width: 250,
              child: Image.asset('assets/logo.jpeg',fit: BoxFit.fitHeight,)), // Your logo widget
        ),
      ),
    );
  }
  Future<void> sendtonextscreen() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isLoggedIn?Home():Login()));

  }
}

