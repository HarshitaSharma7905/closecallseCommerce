import 'package:closecallsecommerce/View/Search/VisualSearchTakePhoto.dart';
import 'package:flutter/material.dart';

class VisualSearch extends StatefulWidget {
  const VisualSearch({Key? key}) : super(key: key);

  @override
  State<VisualSearch> createState() => _VisualSearchState();
}

class _VisualSearchState extends State<VisualSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          title: Text('Visual search',style: TextStyle(color: Colors.black),),
          centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image.png'),fit: BoxFit.cover),
      ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.all(16),
            child: Text('Search for an outfit by taking a photo or uploading an image',style: TextStyle(fontSize: 24,fontWeight:FontWeight.w500,color: Colors.white)),
          ),
          Container(
            width: 300,
            height: 40,
            child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>VisualSearchTakePhoto()));
            },child: Text('TAKE A PHOTO')),
          )
          ,SizedBox(height: 10,),
          Container(
            width: 300,
            height: 40,
            child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.transparent) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)))),onPressed: () {

            },child: Text('UPLOAD AN IMAGE')),
          )

        ]),

    ));
  }
}
