import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  bool _boolstore =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Rating & Reviews',style: TextStyle(color: Colors.black)),centerTitle: true,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _boolstore=false;
          });
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10),
                    child: Text('Rating & Reviews',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),)),SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Image.asset('assets/Product/Ratingblock.png'),
                ),
                   Container(
                     padding: EdgeInsets.only(top: 15),
                     child: Image.asset('assets/Product/column.png'),),
                Container(
                  padding: EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                  height: 70,
                  child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
                   setState(() {
                     _boolstore=true;
                     });
                  },child: Text('Write a Review')),
                )
                 ],
               ),
          ),
        ),
      ),
    bottomSheet: Visibility(
      visible: _boolstore,
      child: Container(
        height: 400,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 300,
                child: TextField(
                    decoration: InputDecoration(icon: Icon(Icons.edit,color: Colors.black),label:Text('Write your Review'),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                    ),
                  ),
            ),Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              height: 70,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

              },child: Text('Submit')),
            ),

          ],
        ),
      ),
    ),
      );

  }
}
