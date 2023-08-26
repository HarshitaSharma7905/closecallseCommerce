import 'package:closecallsecommerce/View/Catalog/Catalogmain.dart';
import 'package:closecallsecommerce/View/Catalog/Ctalogmain2.dart';
import 'package:closecallsecommerce/View/Catalog/Filter.dart';
import 'package:closecallsecommerce/View/Catalog/FilterList.dart';
import 'package:closecallsecommerce/View/Favourite/Favourites.dart';
import 'package:closecallsecommerce/View/Main/MainPage.dart';
import 'package:closecallsecommerce/View/MyBag/MyBag.dart';
import 'package:closecallsecommerce/View/Product/ProductCart.dart';
import 'package:closecallsecommerce/View/Product/Rating.dart';
import 'package:closecallsecommerce/View/Profile/Orders/OrderDetails.dart';
import 'package:closecallsecommerce/View/Profile/Profile.dart';
import 'package:closecallsecommerce/View/Search/VisualSearch.dart';
import 'package:closecallsecommerce/View/Search/VisualSearchCrop.dart';
import 'package:closecallsecommerce/View/Search/VisualSearchTakePhoto.dart';
import 'package:closecallsecommerce/View/Shops/CategorySearch.dart';
import 'package:closecallsecommerce/View/Success/Success.dart';
import 'package:closecallsecommerce/View/Success/SuccessCart.dart';
import 'package:closecallsecommerce/View/UserAccess/ForgetPassword.dart';
import 'package:closecallsecommerce/View/UserAccess/Login.dart';
import 'package:closecallsecommerce/View/UserAccess/Setting.dart';
import 'package:closecallsecommerce/View/UserAccess/SignUp.dart';
import 'package:closecallsecommerce/View/Welcome/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'View/MyBag/AddShippingAddress.dart';
import 'View/MyBag/ShippingAddress.dart';
import 'View/Profile/Orders.dart';
import 'View/Search/VisualSearchFinding.dart';
import 'View/Shops/Category.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
