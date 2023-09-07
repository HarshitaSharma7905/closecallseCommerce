import 'package:closecallsecommerce/View/MyBag/ShippingAddress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);
  @override
  State<MyBag> createState() => _MyBagState();
}
class _MyBagState extends State<MyBag> {
  late SharedPreferences prefers;
  late final String uid;

  Future<void> _sharedpreference() async
  {
     prefers = await SharedPreferences.getInstance();
     setState(() {
       uid = prefers.getString('uid')!;
     });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sharedpreference();
  }
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').snapshots(),
               builder:(context, snapshot) {
                 List<DocumentSnapshot> document = snapshot.data!.docs;
                 // Calculate total outside the FutureBuilder
                 int total=0;
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Wrap(
                      children:List.generate(
                          document.length, (index) {

                            Map<String,dynamic> data = document[index].data() as Map<String,dynamic>;
                            String col1 = data['col1'];
                            String col2 = data['col2'];
                            String id1 = data['id1'];
                            String productColor = data['productColor'];
                            String productId = data['productId'];
                            String productSize = data['productSize'];
                            int quantity=data['quantity'];
                            return FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance.collection(col1).doc(id1).collection(col2).doc(productId).get(),
                              builder: (context, snapshot) {
                                Map<String,dynamic> productData= snapshot.data?.data() as Map<String,dynamic>;
                                int price = int.parse(productData['price']);
                                int totalPrice = quantity * price;

                                (document,totalPrice);

                                String totalPriceAsString = totalPrice.toString();
                                String title = productData['title'];
                                int maxCharacters = 10; // Show the first 10 characters

                                String shortenedTitle = title.length > maxCharacters
                                    ? title.substring(0, maxCharacters)
                                    : title;
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  height: 120,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 120,
                                          child: Image.network(productData['image'],fit: BoxFit.fitWidth),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          alignment: Alignment.centerLeft,
                                          width: 160,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(shortenedTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                                Container(
                                                  padding: EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text('Color :'),
                                                          Text(productColor,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                                                        ],),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text('Size :'),
                                                          Text(productSize,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                                                        ],)
                                                    ],),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap:() {
                                                          FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').doc(document[index].id).get().then((docSnapshot) {
                                                            if (docSnapshot.exists) {
                                                              int currentQuantity = quantity ?? 0; // Get the current quantity or default to 0
                                                              int newQuantity = currentQuantity + 1; // Increment the quantity by 1

                                                              FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').doc(document[index].id).update({
                                                                'quantity': newQuantity,
                                                              }).then((_) {
                                                                print('Quantity updated successfully');
                                                              }).catchError((error) {
                                                                print('Error updating quantity: $error');
                                                              });
                                                            } else {
                                                              print('Document does not exist');
                                                            }
                                                          }).catchError((error) {
                                                            print('Error fetching document: $error');
                                                          });

                                                        },
                                                        child: Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                                                            child: Center(child: Icon(Icons.add,color: Colors.black,))),
                                                      ),
                                                      Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                                                          child: Center(child: Text(quantity.toString(),style: TextStyle(color: Colors.black),))),

                                                      GestureDetector(
                                                        onTap: () {
                                                          FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').doc(document[index].id).get().then((docSnapshot) {
                                                            if (docSnapshot.exists) {
                                                              int currentQuantity = quantity ?? 0; // Get the current quantity or default to 0
                                                              int newQuantity = currentQuantity - 1; // Increment the quantity by 1

                                                             if(currentQuantity>1){
                                                               FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').doc(document[index].id).update({
                                                                 'quantity': newQuantity,
                                                               }).then((_) {
                                                                 print('Quantity updated successfully');
                                                               }).catchError((error) {
                                                                 print('Error updating quantity: $error');
                                                               });
                                                             }
                                                            } else {
                                                              print('Document does not exist');
                                                            }
                                                          }).catchError((error) {
                                                            print('Error fetching document: $error');
                                                          });
                                                        },
                                                        child: Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                                                            child: Center(child: Icon(Icons.remove,color: Colors.black,))),
                                                      ),
                                                    ],),
                                                )
                                              ]),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    String productId = document[index].id;
                                                    FirebaseFirestore.instance.collection('customer').doc(uid).collection('cart').doc(productId).delete().whenComplete(() =>ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                      content: Text("Deleted from cart successfully "),
                                                    )));
                                                  },
                                                    child: Icon(Icons.cancel_outlined,color: Colors.red)),
                                                Text("₹"+totalPriceAsString,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                              ]),
                                        ),
                                      ]),
                                );

                              },
                            );
                          },)

                ),
                     Column(
                       children: [


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
                     )
                   ],
                 );
               },

             )

      ),



    );
  }
//  cart design

}
