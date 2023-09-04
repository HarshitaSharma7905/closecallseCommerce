import 'package:closecallsecommerce/View/Catalog/Ctalogmain2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Kid extends StatefulWidget {
  const Kid({Key? key}) : super(key: key);

  @override
  State<Kid> createState() => _KidState();
}

class _KidState extends State<Kid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('children').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<DocumentSnapshot> document= snapshot.data!.docs;
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) {
              Map<String,dynamic> data=document[index].data() as Map<String,dynamic>;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogmain2(collection1: 'children', collection2: 'product', uid: document[index].id, title:data['title']),));
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
      },
    );
  }
}
