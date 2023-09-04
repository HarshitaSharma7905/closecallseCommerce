import 'dart:html';

import 'package:closecallsecommerce/View/Catalog/Ctalogmain2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Women extends StatefulWidget {
  const Women({Key? key}) : super(key: key);

  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
            stream:FirebaseFirestore.instance.collection('women').snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder:(context, index) {
                    Map<String,dynamic> data=documents[index].data() as Map<String,dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) =>
                            Catalogmain2(title: data['title'],collection1: 'women',uid: documents[index].id,collection2: 'product',)));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
                        margin:EdgeInsets.all(5) ,
                        child: Row(children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                data['title'],
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.network(data['imageurl']),
                              )),
                        ]),
                      ),
                    );
                  },
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          );
  }
}
