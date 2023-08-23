import 'package:flutter/material.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Shipping Address',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: GestureDetector(onTap: () {
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('Name'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('Address'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('City'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('State'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('Pin Code'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 64,
            width: 450,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(label:Text('Country'),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                )
            ),
          ),SizedBox(height: 15,),
          Container(
            width: 250,
            height: 40,
            child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

            },child: Text('Save Address')),
          )
        ]),
      ),
    );
  }
}
