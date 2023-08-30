import 'package:closecallsecommerce/View/Main/MainPage.dart';
import 'package:closecallsecommerce/View/UserAccess/ForgetPassword.dart';
import 'package:closecallsecommerce/View/UserAccess/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _getSharedPreferences();
  }

  _getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Do something with prefs if needed
    bool? isLoggedIn=prefs.getBool('isLoggedIn');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
         title: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

         ]),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20,bottom: 0,left: 10,right: 10),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Text('Login',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold)),
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
                  controller: emailController,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(label:Text('Email'),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
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

                },child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text("Forgot Password?",style: TextStyle(color: Colors.black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                        },
                        child: Icon(Icons.arrow_right_alt_sharp,color: Colors.red,))
                  ],
                )),
              ),
              SizedBox(height: 10,),
              Container(
                width: 450,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () async {
                  String email =emailController.text.trim();
                  String password = passwordController.text.trim();
                  if(email==''||password==''){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Enter Valid Detail "),
                    ));
                  }else{
                    try{
                      UserCredential usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                      if(usercredential !=null){
                        print(usercredential);
                        String? uid = usercredential.user?.uid;
                        //to store data locally----
                        prefs.setString('uid', uid!);
                        prefs.setBool('isLoggedIn', true);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("User doesnt exist"),
                        ));
                      }
                    }catch(error){
                      String errorMessage = "An error occurred";
                      if (error is FirebaseAuthException) {
                        if (error.code == 'user-not-found') {
                          errorMessage = "User doesn't exist";
                        } else if (error.code == 'wrong-password') {
                          errorMessage = "Incorrect password";
                        }
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(errorMessage)),
                      );
                    }

                  }

                },child: Text('Login')),
              )
            ]),
          ),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          }, child: Text("Don't have account?",style: TextStyle(color: Colors.black),),),
        ],
      ),
      persistentFooterButtons: [Container(
        height: 100,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text('Or login with social account',style: TextStyle(fontSize: 14),),
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
