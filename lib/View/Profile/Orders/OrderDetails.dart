import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text('Order Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),centerTitle: true,
        actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text('Order №1947034',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                   Text('05-12-2019',style: TextStyle(fontSize: 14,color: Colors.grey),)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('Tracking number:'+"IW3475453455",style: TextStyle(fontSize:14,color: Colors.grey )),
                Text('Delivered',style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
