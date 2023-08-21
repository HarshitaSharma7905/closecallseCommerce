import 'package:closecallsecommerce/View/Catalog/Catalogmain.dart';
import 'package:flutter/material.dart';

class Women extends StatefulWidget {
  const Women({Key? key}) : super(key: key);

  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(flex: 1,
            child: Container(
              margin:EdgeInsets.all(5) ,
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SUMMER SALES',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24,color: Colors.white),),
                      Text('Up to 50% off',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
                    
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Catalogmain()));
            },child: Expanded(flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
                margin:EdgeInsets.all(5) ,
                child: Row(children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('New',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)),
                  Expanded(child: Container(
                    child: Image.asset('assets/category/new.png'),
                  )),
                ]),

              ),
            ),
          ), Expanded(flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
              margin:EdgeInsets.all(5) ,
              child: Row(children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Cloths',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)),
                Expanded(child: Container(
                  child: Image.asset('assets/category/cloths.png'),
                )),
              ]),

            ),
          ), Expanded(flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
              margin:EdgeInsets.all(5) ,
              child: Row(children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Shoes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)),
                Expanded(child: Container(
                  child: Image.asset('assets/category/shoes.png'),
                )),
              ]),
            ),
          ), Expanded(flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
              margin:EdgeInsets.all(5) ,
              child: Row(children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Accesories',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)),
                Expanded(child: Container(
                  child: Image.asset('assets/category/accesories.png'),
                )),
              ]),

            ),
          ),
        ],
      ),
    );
  }
}
