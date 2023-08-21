import 'package:flutter/material.dart';
class VisualSearchCrop extends StatefulWidget {
  const VisualSearchCrop({Key? key}) : super(key: key);

  @override
  State<VisualSearchCrop> createState() => _VisualSearchCropState();
}

class _VisualSearchCropState extends State<VisualSearchCrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Crop the item',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image2.png'),fit: BoxFit.cover),
        ),
        child:Stack(children: [
          Positioned.fill(child: Transform.scale(scale: 10,child: Icon(Icons.crop_free,color: Colors.white,size: 15,)),)
        ]) ,
      ),
      persistentFooterButtons: [
        Container(
          alignment: Alignment.center,
          height: 80,
          child:  Container(height: 50,width: 50,
            decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
            child: Icon(Icons.search,color: Colors.white),
          ),)
      ],
    );
  }
}
