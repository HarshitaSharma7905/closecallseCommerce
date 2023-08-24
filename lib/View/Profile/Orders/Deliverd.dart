import 'package:flutter/material.dart';

class Delivered extends StatefulWidget {
  const Delivered({Key? key}) : super(key: key);

  @override
  State<Delivered> createState() => _DeliveredState();
}

class _DeliveredState extends State<Delivered> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _deliveredWidget('3543445','15-12-2023','KFDGJGD453','5','5000',Colors.green),
        _deliveredWidget('3543445','15-12-2023','KFDGJGD453','5','5000',Colors.green),
        _deliveredWidget('3543445','15-12-2023','KFDGJGD453','5','5000',Colors.green)
    ],);
  }
  Widget _deliveredWidget(String orno,String date,String trackno,String quntity,String amount,Color color){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Order No :-'+orno,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
              Text(date,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),

            ],),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.centerLeft,
                child: Text('Tracking number: :-'+trackno,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),)),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantity :-'+quntity,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                Text('Amount :-'+amount,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),

              ],),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),backgroundColor: MaterialStateProperty.all(Colors.white)),onPressed: () {

                }, child: Text('Deails',style: TextStyle(color: Colors.grey),)),
                Text('Delivered',style: TextStyle(fontSize: 16,color: color,fontWeight: FontWeight.bold),)

              ],),
          ]
      ),
    );
  }
}
