import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();
  TextEditingController countryController=TextEditingController();
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
              controller: nameController,
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
              controller: addressController,
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
              controller: cityController,
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
            child: TextField(controller: stateController,
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
              controller: pincodeController,
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
              controller: countryController,
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
            child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () async {
            String name=nameController.text.trim();
            String address=addressController.text.trim();
            String city=cityController.text.trim();
            String state=stateController.text.trim();
            String  pincode=pincodeController.text.trim();
            String  country=countryController.text.trim();
            if(name==''||address==''||city==''||state==''||pincode==''||country==''){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Enter Valid Detail "),
              ));
            }else{
              try{
                SharedPreferences prefs=await SharedPreferences.getInstance();
                String? uid=prefs.getString('uid');
             CollectionReference collectionreference=  await FirebaseFirestore.instance.collection('shippingAddress').doc(uid).collection('address');
                       await collectionreference.add({'name':name,'address':address,'city':city,'state':state,'pincode':pincode,'country':country});
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Address added successfully"),
                ));
              }catch(err){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Something went wrong "),
                ));
              }
            }
            },child: Text('Save Address')),
          )
        ]),
      ),
    );
  }
}
