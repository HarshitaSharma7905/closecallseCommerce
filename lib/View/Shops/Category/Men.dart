import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Men extends StatefulWidget {
  const Men({Key? key}) : super(key: key);

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('mens').snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder:(context, index) {
                Map<String,dynamic> data=documents[index].data() as Map<String,dynamic>;
                return Container(
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
