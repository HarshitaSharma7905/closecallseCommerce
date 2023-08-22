import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,))
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(top: 20,bottom: 0,left: 10,right: 10),

          alignment: Alignment.centerLeft,
          child: Text('Forgot Password',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.only(top: 20,bottom: 10,right: 10,left: 10),
          child: Column(children: [
            Container(
              child: Text('Please, enter your email address. You will receive a link to create a new password via email.'
                  ,style: TextStyle(fontSize: 12)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 64,
              width: 450,
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(label:Text('Email'),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('Not a valid email address. Should be your@email.com',style: TextStyle(fontSize: 10,color: Colors.red)),
            ),
            SizedBox(height: 20,),
            Container(
              width: 450,
              height: 40,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

              },child: Text('Send')),
            )
          ]),
        )
      ]),
    );
  }
}
