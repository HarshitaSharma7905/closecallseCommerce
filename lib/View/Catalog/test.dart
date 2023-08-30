// import 'dart:html';
//
// import 'package:closecallsecommerce/View/Product/ProductCart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Catalogmain2 extends StatefulWidget {
//   const Catalogmain2({Key? key}) : super(key: key);
//
//   @override
//   State<Catalogmain2> createState() => _Catalogmain2State();
// }
//
// class _Catalogmain2State extends State<Catalogmain2> {
//
//   //dropdown city
//   int selectedIndex = -1;
//   int selectedSizeIndex=-1;
//   bool _bool=false;
//   bool _boolSize=false;
//   List<String> sizes=['XS','S','M','L','XL','XXL'];
//   List<String> items = ['Popular','Newest','Customer Review','Price:lowest to highest','Price:highest to lowest'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: GestureDetector(onTap: () {
//             Navigator.pop(context);
//           },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
//           title: Text("Women's Tops",style: TextStyle(color: Colors.black,)),
//           centerTitle: true,
//           actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
//           bottom:PreferredSize(
//             preferredSize: Size.fromHeight(100),
//             child: Column(
//                 children: [
//
//                   Container(
//                     height: 50,
//                     padding: EdgeInsets.all(10),
//                     child: Row(children: [
//                       Expanded(child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 40,
//                               child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
//
//                               },child: Text('T-Shirt')),
//                             ),
//                             SizedBox(width: 10,),
//                             Container(
//                               width: 100,
//                               height: 40,
//                               child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
//
//                               },child: Text('T-Shirt')),
//                             ),
//                             SizedBox(width: 10,),
//                             Container(
//                               width: 100,
//                               height: 40,
//                               child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
//
//                               },child: Text('T-Shirt')),
//                             ),
//                             SizedBox(width: 10,),
//                             Container(
//                               width: 100,
//                               height: 40,
//                               child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
//
//                               },child: Text('T-Shirt')),
//                             )
//                           ]),)
//
//
//                     ]),),
//                   Container(
//                     height: 50,
//                     padding: EdgeInsets.all(10),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               // Handle button press
//                               setState(() {
//                                 _bool=true;
//                                 _boolSize=false;
//                               });
//                             },
//                             child: Row( // Use Row to create a row of icon and text
//                               children: [
//                                 Icon(Icons.filter_list_outlined,color: Colors.black,), // Add the icon
//                                 SizedBox(width: 5), // Add spacing between icon and text
//                                 Text('Filters',style: TextStyle(color: Colors.black,fontSize: 11),), // Add the text
//                               ],
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // Handle button press
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,// Use Row to create a row of icon and text
//                               children: [
//                                 Icon(Icons.arrow_upward_outlined,color: Colors.black,),
//                                 Icon(Icons.arrow_downward_outlined,color: Colors.black,), // Add the icon
//                                 SizedBox(width: 5), // Add spacing between icon and text
//                                 Text('Price: lowest to high',style: TextStyle(color: Colors.black,fontSize: 11),), // Add the text
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _bool=false;
//                                   _boolSize=true;
//
//                                 });
//                               },
//                               child: Icon(Icons.list_sharp))
//
//                         ]),
//                   ),
//                 ]
//             ),)
//       ),
//       body: StreamBuilder<QuerySnapshot> (
//         stream: FirebaseFirestore.instance.collection('women').doc('BsnxeGowDCG5EaNBgejA').collection('product').snapshots(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//             List<DocumentSnapshot> document=snapshot.data!.docs;
//             return ListView.builder(
//               itemCount: document.length,
//               itemBuilder: (context, index) {
//                 Map<String,dynamic> data=document[index].data() as Map<String,dynamic>;
//                 return
//               },
//             );
//           }else{
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       bottomSheet:  Container(
//         height: 400,
//         child: Column(
//           children: [
//             Visibility(
//               visible: _boolSize,
//               child: Container(
//                 height: 400,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(15),
//                       child: Text(
//                         'Size',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Wrap(
//                         spacing: 16.0, // Adjust the spacing between items
//                         children: List.generate(items.length, (index) {
//                           return Container(
//                             width: 100, // Adjust the width as needed
//                             color: selectedSizeIndex == index ? Colors.red : null,
//                             padding: EdgeInsets.all(16.0),
//                             child: _sizeButton(
//                               index,sizes[index], selectedIndex == index ? Colors.red : Colors.white, selectedIndex == index ? Colors.white : Colors.black,
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//             Visibility(
//               visible: _bool,
//               child: Container(
//                 height: 400,
//                 decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),
//                 child: Column(
//                   children: [
//                     Container(
//                         padding: EdgeInsets.all(15),
//                         child: Text('Sort',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),)),
//                     Container(
//                       height: 200,
//                       child:ListView.builder(
//                         itemCount: items.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = index;
//                                 _bool=false;
//                               });
//                             },
//                             child: Container(
//                               color: selectedIndex == index ? Colors.red : null,
//                               padding: EdgeInsets.all(16.0),
//                               child: Text(
//                                 items[index],
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: selectedIndex == index ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       //
//     );
//   }
//   Widget _sizeButton(int index,String label,Color color,Color textColor){
//     return  Container(
//         height:40 ,
//         width:60 ,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//         child: Center(child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),onPressed: () {
//           setState(() {
//             selectedIndex = index;
//             _bool = false;
//           });
//
//         },child:  Text(label,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: textColor),)),
//         ));
//   }
// }
// // Text('Sort',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
//
//
// GestureDetector(
// onTap: () {
// setState(() {
// _bool=false;
// _boolSize=false;
// });
// },
// child: SingleChildScrollView(
// child: Column(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCart(),));
// },
// child: Container(
// child: Row(
// children: [
// Container(
// child: Image.asset('assets/catalog.png'),
// ),
// Expanded(
// child: Container(
// child: Image.asset('assets/img2.png'),
// ),
// )
// ],
// ),
// ),
// ),
// Container(child: Row(
// children: [
// Container(
// child: Image.asset('assets/catalog.png'),
// ),
// Expanded(
// child: Container(
// child: Image.asset('assets/img2.png'),
// ),
// )
// ],
// ),),
//
// ],
//
// ),
// ),
// ),