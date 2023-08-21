import 'package:closecallsecommerce/View/Catalog/Catalogmain.dart';
import 'package:closecallsecommerce/View/Main/MainPage.dart';
import 'package:closecallsecommerce/View/Search/VisualSearch.dart';
import 'package:closecallsecommerce/View/Search/VisualSearchCrop.dart';
import 'package:closecallsecommerce/View/Search/VisualSearchTakePhoto.dart';
import 'package:closecallsecommerce/View/Shops/CategorySearch.dart';
import 'package:closecallsecommerce/View/UserAccess/ForgetPassword.dart';
import 'package:closecallsecommerce/View/UserAccess/Login.dart';
import 'package:closecallsecommerce/View/UserAccess/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/Search/VisualSearchFinding.dart';
import 'View/Shops/Category.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
