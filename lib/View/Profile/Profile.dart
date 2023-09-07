import 'package:closecallsecommerce/View/Product/Rating.dart';
import 'package:closecallsecommerce/View/Profile/Orders.dart';
import 'package:closecallsecommerce/View/UserAccess/Login.dart';
import 'package:closecallsecommerce/View/UserAccess/Setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../MyBag/AddShippingAddress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String uid;
  late Map<String,dynamic> data={};
  late SharedPreferences prefs;

  Future<void> userDetail() async{
     prefs=await SharedPreferences.getInstance();
    //  To retrieve the data----------
    setState(() {
      uid=prefs.getString('uid')!;
    });
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (documentSnapshot.exists) {
      Map<String, dynamic> fdata = documentSnapshot.data() as Map<String, dynamic>;
     setState(() {
       data=fdata;
     });
    } else {
      print('Document does not exist');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
          bottom:PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text('My Profile',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)),
              ))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                GestureDetector(
                  onTap: () {
                    // FirebaseFirestore.instance.collection('collectionPath').doc();
                  },
                  child: Container(
                    width: 70,
                      height: 70,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                      child: Image.asset('assets/Profile/camera.png')),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['name'].toString(),style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                    Text(data['email'].toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),)
                  ],
                ),
                  ]),
            ),
            SizedBox(height: 5,),
            GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Orders(),));
            }  ,
            child: Container(
              width: 450,color: Colors.white,
                // height: 200,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My orders',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('Already have 12 orders',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 11,color: Colors.grey ),)
                      ],),
                    Container(
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddShippingAddress(),));
              },
              child: Container(
                width: 450,color: Colors.white,
                // height: 200,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping addresses',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('3 addresses',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 11,color: Colors.grey ),)
                      ],),
                    Container(
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ) ,
            SizedBox(height: 5,),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Rating()));
              },
              child: Container(
                width: 450,color: Colors.white,
                // height: 200,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My reviews',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('Reviews for 4 items',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 11,color: Colors.grey ),)
                      ],),
                    Container(
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
              },
              child: Container(
                width: 450,color: Colors.white,
                // height: 200,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Settings',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('Notifications, password',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 11,color: Colors.grey ),)
                      ],),
                    Container(
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                prefs.setBool('isLoggedIn',false);
                prefs.remove('uid');
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Login())));
              },
              child: Container(
                width: 450,color: Colors.white,
                // height: 200,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Logout',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('To handle your Account Safely',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 11,color: Colors.grey ),),
                      ],),
                    Container(
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      );


  }
}
