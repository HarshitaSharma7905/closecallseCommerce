import 'package:closecallsecommerce/View/Catalog/Ctalogmain2.dart';
import 'package:closecallsecommerce/View/Search/VisualSearch.dart';
import 'package:closecallsecommerce/View/Search/VisualSearchFinding.dart';
import 'package:flutter/material.dart';

import '../Catalog/Catalogmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String img1,img2,img3,img4,img5;
  Future<void> fetchimage() async{

  try{
    DocumentSnapshot  documentSnapshot=await FirebaseFirestore.instance.collection('mainpage').doc('HFmLKrieReWpa9Hmx15L').get();
    if(documentSnapshot.exists){
      Map<String,dynamic>   images =documentSnapshot.data() as Map<String,dynamic>;
       setState(() {
         img1= images['img1'];
        img2= images['img2'];
        img3= images['img3'];
        img4= images['img4'];
        img5= images['img5'];
       });
    }
  }catch(err){

  }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchimage();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 450,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(img1),fit: BoxFit.cover),
            ),
            child:Stack(children: [
              Positioned.fill(child:Container(
                alignment: Alignment.bottomLeft,
                 padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Fashion',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text('Sale',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      Container(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>VisualSearch()));
                        },child: Text('Check')),
                      )
                ]),
              ))
            ]) ,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),),
                  Text('You’ve never seen it before!',style: TextStyle(color: Colors.grey,fontSize: 11),)
                ],
              ),
            ),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Catalogmain()));
            }, child: Text('View All',style: TextStyle(color: Colors.black,fontSize:11),))
          ],)),
          Container(
            width: 450,height: 250,
            child: Row(
              children: [
                Expanded(child: ListView(
                  scrollDirection: Axis.horizontal,
                children: [
                  StreamBuilder<QuerySnapshot> (
                    stream: FirebaseFirestore.instance.collection('new').snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        List<DocumentSnapshot> document=snapshot.data!.docs;
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(document.length, (index) {
                            Map<String, dynamic> data = document[index].data() as Map<String, dynamic>;

                            String title = data['title'];
                            int maxCharacters = 10; // Show the first 10 characters

                            String shortenedTitle = title.length > maxCharacters
                                ? title.substring(0, maxCharacters)
                                : title;

                            return Container(
                              padding: EdgeInsets.all(10),
                              height: 300,
                              width: 160,

                              child: Column(
                                children: [
                                  Image.network(data['image'], scale: 5,),SizedBox(height: 5,),
                                  Text(data['category'],style: TextStyle(fontSize: 14,color: Colors.grey),),SizedBox(height: 5,),
                                  Text(shortenedTitle, style: TextStyle(fontSize: 18, color: Colors.black)),SizedBox(height: 5,),
                                  Image.asset('assets/rating.png'),SizedBox(height: 5,),
                                  Text('₹'+data['price'],style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)

                                ],
                              ),
                            );
                          }),
                        );


                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                ],
                ))
              ],
            ),
          ),
        //  main page 2
          Container(
            height: 190,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(image: DecorationImage(image:NetworkImage(img2),fit: BoxFit.cover),
            ),
            child:Stack(children: [
              Positioned.fill(child:Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Text('Street clothes',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
              ))
            ]) ,
          ),

          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sale',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),),
                        Text('Super summer sale',style: TextStyle(color: Colors.grey,fontSize: 11),)
                      ],
                    ),
                  ),
                  TextButton(onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Catalogmain()));
                  }, child: Text('View All',style: TextStyle(color: Colors.black,fontSize:11),))
                ],)),
          Container(
            width: 450,height: 250,
            child: Row(
              children: [
                Expanded(
                  child: ListView(scrollDirection: Axis.horizontal,
                    children: [
                      StreamBuilder<QuerySnapshot> (
                        stream: FirebaseFirestore.instance.collection('sales').snapshots(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            List<DocumentSnapshot> document=snapshot.data!.docs;
                            return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(document.length, (index) {
                                Map<String, dynamic> data = document[index].data() as Map<String, dynamic>;

                                String title = data['title'];
                                int maxCharacters = 10; // Show the first 10 characters

                                String shortenedTitle = title.length > maxCharacters
                                    ? title.substring(0, maxCharacters)
                                    : title;

                                return Container(
                                  padding: EdgeInsets.all(10),
                                  height: 300,
                                  width: 160,

                                  child: Column(
                                    children: [
                                      Image.network(data['image'], scale: 5,),SizedBox(height: 5,),
                                      Text(data['category'],style: TextStyle(fontSize: 14,color: Colors.grey),),SizedBox(height: 5,),
                                      Text(shortenedTitle, style: TextStyle(fontSize: 18, color: Colors.black)),SizedBox(height: 5,),
                                      Image.asset('assets/rating.png'),SizedBox(height: 5,),
                                      Text('₹'+data['price'],style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)

                                    ],
                                  ),
                                );
                              }),
                            );


                          }else{
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),

                  ],)
                ),
              ],

            ),
          ),

        //  main 3
          Container(
            height: 350,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(img3),fit: BoxFit.cover),
            ),
            child:Stack(children: [
              Positioned.fill(child:Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(15),
                  child: Text('New collection',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
              ))
            ]) ,
          ),
          Container(
            height: 370,
            child: Row(
              children: [

                Expanded(child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            child: Container(
                              width: 150,
                              child: Text('Summer sale',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 34,color: Colors.red,fontWeight: FontWeight.bold)),
                            ),
                         alignment: Alignment.center, )),
                      Expanded(
                          child: Container(
                            child: Image.network(img4),
                          )),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                      child: Image.network(img5),
                    )),
              ],
            ),
          )

        ],
      ),
    );
  }
}
