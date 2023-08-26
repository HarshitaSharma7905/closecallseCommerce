import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _boolpassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          backgroundColor: Colors.white,
          actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
          bottom:PreferredSize(
              preferredSize: Size.fromHeight(50),
              child:  Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text('Settings',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)),
              ),)
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _boolpassword=false;
          });
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Personal Information',style: TextStyle(fontSize: 16,color: Colors.black),),
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 64,
                    width: 450,
                    color: Colors.white,
                    padding: EdgeInsets.all(5),
                    child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(label:Text('Full Name'),
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
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(label:Text('Email'),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                        )
                    ),
                  ),
                ],),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Password',style: TextStyle(fontSize: 16,color: Colors.black),),
                  TextButton(onPressed: () {
                    setState(() {
                      _boolpassword=true;
                    });
                  }, child: Text('Change',style: TextStyle(color: Colors.grey),))
                ],),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 64,
                  width: 450,
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(label:Text('Password'),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                      )
                  ),
                ),
          ]),
        ),
      ),
      bottomSheet: Visibility(
        visible: _boolpassword,
        child: Container(
          padding: EdgeInsets.all(15),
          height: 400,
          child: Column(children: [
            Center(child: Text('Password Change',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 64,
              width: 450,
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(label:Text('Old Password'),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                  )
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child:TextButton(child: Text('Forgot Password',style: TextStyle(fontSize: 16,color: Colors.grey),),onPressed: () {

              },) ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 64,
              width: 450,
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(label:Text('New Password'),
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
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(label:Text('Repeat Password'),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                  )
              ),
            ),SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 180,
                height: 40,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                },child: Text('Save Password',style:TextStyle(fontSize: 14),)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
