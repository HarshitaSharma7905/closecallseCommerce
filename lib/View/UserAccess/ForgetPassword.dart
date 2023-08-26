import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController =TextEditingController();
  String errorMessage='';

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
                controller: emailController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(label:Text('Email'),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(errorMessage,style: TextStyle(fontSize: 10,color: Colors.red)),
            ),
            SizedBox(height: 20,),
            Container(
              width: 450,
              height: 40,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () async {
                 String email=emailController.text.trim();
                 if(email==''){
                   setState(() {
                    errorMessage='Not a valid email address. Should be your@email.com';
                   });
                 }else{
                   try {
                     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text("Password reset link sent to your email."),
                       ),
                     );
                   } catch (error) {
                     String errorMessage = "An error occurred. Please try again.";

                     if (error is FirebaseAuthException) {
                       switch (error.code) {
                         case 'invalid-email':
                           errorMessage = "Invalid email address.";
                           break;
                         case 'user-not-found':
                           errorMessage = "No user found with this email.";
                           break;
                         default:
                           errorMessage = error.message ?? errorMessage;
                       }
                     }

                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text(errorMessage),
                       ),
                     );
                   }


                 }
              },child: Text('Send')),
            )
          ]),
        )
      ]),
    );
  }
}
