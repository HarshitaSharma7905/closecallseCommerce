import 'package:flutter/material.dart';
class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 450,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Success/successgirl.png'),scale: 1,fit: BoxFit.cover),

        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 250,
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Text('Success!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),)),
            SizedBox(height: 10,),
            Container(
                width: 250,
                alignment: Alignment.center,
                child: Text("Your order will be delivered soon.Thank you for choosing our app!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)),
            SizedBox(height: 10,),
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
