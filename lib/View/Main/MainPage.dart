
import 'package:closecallsecommerce/View/Main/Home.dart';
import 'package:closecallsecommerce/View/Shops/Category.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index=0;
  List screen=[Home(),Category(),Text('Bag'),Text('Favourites'),Text('profile')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
         currentIndex: index,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,

          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label: 'Shop' ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,),label: 'Bag'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined,),label: 'Favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded,),label: 'Profile'),

      ]),
    );
  }
}

