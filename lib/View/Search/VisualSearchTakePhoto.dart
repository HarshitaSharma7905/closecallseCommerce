import 'package:closecallsecommerce/View/Search/VisualSearchCrop.dart';
import 'package:flutter/material.dart';

class VisualSearchTakePhoto extends StatefulWidget {
  const VisualSearchTakePhoto({Key? key}) : super(key: key);

  @override
  State<VisualSearchTakePhoto> createState() => _VisualSearchTakePhotoState();
}

class _VisualSearchTakePhotoState extends State<VisualSearchTakePhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Search by taking a photo',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image2.png'),fit: BoxFit.cover),
        ),
      ),
      persistentFooterButtons: [
        Container(height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 50,width: 50,
              child: Icon(Icons.flash_on,color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VisualSearchCrop()));
              },
              child: Container(height: 50,width: 50,
                decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                child: Icon(Icons.camera_alt_outlined,color: Colors.white),
              ),
            ),
            Container(height: 50,width: 50,
              child: Icon(Icons.sync,color: Colors.black),
            ),
          ],
        ),)
      ],
    );
  }
}
