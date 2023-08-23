import 'package:flutter/material.dart';

class SuccessCart extends StatefulWidget {
  const SuccessCart({Key? key}) : super(key: key);

  @override
  State<SuccessCart> createState() => _SuccessCartState();
}

class _SuccessCartState extends State<SuccessCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      alignment: Alignment.center,
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                    width: 250,
                    height: 250,
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Image.asset('assets/Success/successbag.png')),
                SizedBox(height: 10,),
                Container(
                    width: 250,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: Text('Success!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),)),
                SizedBox(height: 10,),
                Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: Text("Your order will be delivered soon.Thank you for choosing our app!",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black),)),
                SizedBox(height: 10,),
              ],),
              Container(
                width: 250,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                },child: Text('Continue Shopping')),
              )
            ]),
      ),
    );
  }
}
