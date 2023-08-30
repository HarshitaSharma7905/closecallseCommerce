
import 'package:closecallsecommerce/View/Main/MainPage.dart';

import 'package:closecallsecommerce/View/Welcome/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
bool? isLoggedIn=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _getSharedPreferences();
  runApp(MyApp());
}
_getSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Do something with prefs if needed
     isLoggedIn=prefs.getBool('isLoggedIn');
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:isLoggedIn==true?MainPage():SplashScreen(),
    );
  }
}
