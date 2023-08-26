import 'package:flutter/material.dart';

import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _button=false;
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,))
      ),
      body: Container(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 0,left: 10,right: 10),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Text('Sign up',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold)),
            ),
           Container(
             padding: EdgeInsets.only(top: 20,bottom: 10,right: 10,left: 10),
             child: Column(children: [
               Container(
                 margin: EdgeInsets.only(top: 20),
                 height: 64,
                 width: 450,
                 color: Colors.white,
                 padding: EdgeInsets.all(5),
                 child: TextField(
                     controller:nameController ,
                     style: TextStyle(fontSize: 14),
                     decoration: InputDecoration(label:Text('Name'),
                         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                     )
                 ),
               ),
               SizedBox(height: 10,),
               Container(

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
               SizedBox(height: 10,),
               Container(

                 height: 64,
                 width: 450,
                 color: Colors.white,
                 padding: EdgeInsets.all(5),
                 child: TextField(
                   controller: passwordController,
                     style: TextStyle(fontSize: 14),
                     decoration: InputDecoration(label:Text('Password'),
                         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                     )
                 ),
               ),

               Container(
                 padding: EdgeInsets.all(10),
                 alignment: Alignment.centerRight,
                 child: TextButton(onPressed:() {

                 },child: GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text('Already have an account? ',style: TextStyle(color: Colors.black),),
                       Icon(Icons.arrow_right_alt_sharp,color: Colors.red,)
                     ],
                   ),
                 )),
               ),
               SizedBox(height: 10,),
               Container(
                 width: 450,
                 height: 40,
                 child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed:_button?null: () async {
                   setState(() {
                     _button=true;
                   });
                   String name=nameController.text.toString();
                   String email=emailController.text.toString();
                   String password=passwordController.text.toString();

                   if(name==''||email==''||password=='')
                     {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: Text("Enter Valid Detail "),
                       ));
                     }else
                     try{
                       UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                       if(userCredential!=null){

                         // Get the newly registered user's UID
                         String? uid = userCredential.user?.uid;
                        await FirebaseFirestore.instance.collection('users').doc(uid).set({
                          'name': name,
                          'email': email,
                        });



                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("Account Created Successfully"),
                         ));
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                       }
                     }catch(error){
                       String errorMessage = "An error occurred";
                       if (error is FirebaseAuthException) {
                         if (error.code == 'weak-password') {
                           errorMessage = "Password is too weak";
                         } else if (error.code == 'email-already-in-use') {
                           errorMessage = "Email is already in use";
                         } else {
                           errorMessage = error.message ?? errorMessage;
                         }
                       }
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: Text(errorMessage),
                       ));

                     }

                     {

                   }
                 },child: _button?CircularProgressIndicator(color: Colors.white,):Text('Sign up')),
               )
             ],),
           )
          ],
        ),
      ),
      persistentFooterButtons: [Container(
        height: 100,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text('Or sign up with social account',style: TextStyle(fontSize: 14),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100,height: 30,child: Image.asset('assets/google.png',scale: 3,)),
              Container(width: 100,height: 30,child: Image.asset('assets/facebook.png',scale: 3,))
            ],
          )
        ],),
      )],
    );
  }
}
