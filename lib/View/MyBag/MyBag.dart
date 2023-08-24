import 'package:closecallsecommerce/View/MyBag/ShippingAddress.dart';
import 'package:flutter/material.dart';

class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: GestureDetector(onTap: () {

           Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          bottom:PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text('My Bag',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)),
            ))
      ),
      body: SingleChildScrollView(
        child: Wrap(children: [
          _cartDesign('url','Adidas','Black','L','600',),
          _cartDesign('url','Adidas','Black','L','600',),
          _cartDesign('url','Adidas','Black','L','600',),
          _cartDesign('url','Adidas','Black','L','600',),
          _cartDesign('url','Adidas','Black','L','600',),
          _cartDesign('url','Adidas','Black','L','600',),
        ]),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Container(
                height: 45,
                padding: EdgeInsets.all(15),
              child: TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.arrow_forward,color: Colors.red,),hintText: 'Enter promo code',icon:Icon(Icons.local_offer,color: Colors.red,),focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none)),),
            ),
            Container(
              padding: EdgeInsets.all(15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Total',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),
                  Text('₹10000',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)
                ],) ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              child: Container(
                width: 250,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingAddress(),));
                },child: Text('CHECK OUT')),
              ),
      ),
          ],
        )],


    );
  }
//  cart design
Widget _cartDesign(String url,String title,String color,String size,String price){
    return Container(
      margin: EdgeInsets.all(5),
      height: 120,
      color: Colors.grey.shade200,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Container(
          width: 120,
          child: Image.asset('assets/Product/pimg1.png',fit: BoxFit.fitWidth),
        ),
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          width: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Adidas",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
           Container(
             padding: EdgeInsets.only(top: 5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Color :'),
                   Text(color,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                 ],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Size :'),
                   Text(size,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                 ],)
             ],),
           ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                    child: Center(child: Icon(Icons.add,color: Colors.black,))),
                    Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                        child: Center(child: Text('1',style: TextStyle(color: Colors.black),))),
                    Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                        child: Center(child: Icon(Icons.remove,color: Colors.black,))),
                  ],),
                )
          ]),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Icon(Icons.more_vert,color: Colors.black),
            Text('₹500',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
          ]),
        ),
      ]),
    );
}
}
