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
      body: SingleChildScrollView(
        child: Container(
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
              ),
              _cartbox('url','Adidas','Red','M','2','500'),
              _cartbox('url','Puma','Green','XL','4','1500'),
              _cartbox('url','Puma','Green','XL','4','1500'),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  Text('Order information',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    child: Row(

                      children: [
                      Expanded(
                        child: Container(

                            child: Text('Shipping Address:',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.grey),)),
                      ),
                      Expanded(child:  Container(child: Text("3 Newbridge Court ,Chino Hills,CA 91709, United States",style: TextStyle(fontSize: 14,color: Colors.black),)),)

                    ],),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 40,
                    child: Row(

                      children: [
                        Expanded(
                          child: Container(

                              child: Text('Delivery method::',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.grey),)),
                        ),
                        Expanded(child:  Container(child: Text("FedEx, 3 days",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.black),)),)

                      ],),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    child: Row(

                      children: [
                        Expanded(
                          child: Container(

                              child: Text('Amount:',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.grey),)),
                        ),
                        Expanded(child:  Container(child: Text("5000",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.black),)),)

                      ],),
                  ),

                ],)
              )
            ],

          ),


        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              child: Container(
                width: 160,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                },child: Text('Reorder',style: TextStyle(color: Colors.black),)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 160,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                },child: Text('Leave Feedback',style:TextStyle(fontSize: 14),)),
              ),
            ),
          ],
        )
      ],
    );
  }
  Widget _cartbox(String url,String title,String color,String size,String unit,String price)
  {
  return  Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            child: Image.asset('assets/OrdersDetails/detail.png')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height: 5,),
            Text('Mango',style: TextStyle(color: Colors.grey,fontSize: 11)),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('Color:'+color,style: TextStyle(color: Colors.grey,fontSize: 11)),SizedBox(width: 20,),
                Text('Size:'+size,style: TextStyle(color: Colors.grey,fontSize: 11)),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Units:'+unit,style: TextStyle(color: Colors.grey,fontSize: 11)),SizedBox(width: 100,),
                Text('₹'+price,style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        )
      ],
    ),
  );

  }
}
