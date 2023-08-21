import 'package:flutter/material.dart';

class VisualSearchFinding extends StatefulWidget {
  const VisualSearchFinding({Key? key}) : super(key: key);

  @override
  State<VisualSearchFinding> createState() => _VisualSearchFindingState();
}

class _VisualSearchFindingState extends State<VisualSearchFinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
         children: [
       Container(
           alignment: Alignment.center,
           child: Icon(Icons.search,size: 48,color: Colors.red,)),
       SizedBox(height: 10,),
       Container(
         width: 250,
         alignment: Alignment.center,
         child: Text('Finding similar results...',textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,))),
     ]),
    );
  }
}
