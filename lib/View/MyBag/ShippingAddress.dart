import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  List<bool> _isCheckedList = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Shipping Address',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: GestureDetector(onTap: () {
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),


      ),
      body: Container(
          padding: EdgeInsets.all(15),
          color: Colors.grey.shade200,
      child: Column(children: [
        _shippingWidget("krishna","3 Newbridge Court Chino Hills, CA 91709, United States"),
        SizedBox(height: 15,),
        _shippingWidget("krishna","3 Newbridge Court Chino Hills, CA 91709, United States")
      ],)),
      floatingActionButton: Container(width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),child: Icon(Icons.add,color: Colors.white,),),
    );
  }
  Widget _shippingWidget(String name,String address){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(name,style: TextStyle(fontSize: 14,color: Colors.black),),
          TextButton(onPressed: () {

          }, child: Text('Edit',style: TextStyle(color: Colors.red),))
        ],),SizedBox(height: 10,),
        Text(address,style: TextStyle(fontSize: 14,color: Colors.black),),
        _checkboxWidget('Adidas', _isCheckedList[0], 0),

      ]),
    );
  }
  Widget _checkboxWidget(String label, bool value, int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            value: value,
            activeColor: Colors.red,
            onChanged: (bool? newValue) {
              setState(() {
                _isCheckedList[index] = newValue!;
              });
            },
          ),
          Text('Use as the shipping address'),
        ],

      ),
    );
  }
}
