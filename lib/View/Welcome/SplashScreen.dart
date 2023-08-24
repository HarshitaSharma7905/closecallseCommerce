import 'dart:async';
import 'package:flutter/material.dart';
import 'package:closecallsecommerce/View/UserAccess/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Animation duration
    );

    // Start the animation
    _animationController.forward();

    // Set a timer for the splash screen duration
    _timer = Timer(Duration(seconds: 5), () {
      // Navigate to the main screen after the timer expires
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
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
}
