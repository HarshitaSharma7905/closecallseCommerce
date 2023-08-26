import 'package:closecallsecommerce/View/Catalog/Filter.dart';
import 'package:closecallsecommerce/View/Catalog/FilterList.dart';
import 'package:flutter/material.dart';

class Catalogmain extends StatefulWidget {
  const Catalogmain({Key? key}) : super(key: key);

  @override
  State<Catalogmain> createState() => _CatalogmainState();
}

class _CatalogmainState extends State<Catalogmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: () {
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: Column(

              children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20),
              child: Text('Women’s tops',style:  TextStyle(fontSize: 34,color: Colors.black,fontWeight: FontWeight.bold),)),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                   Expanded(child: ListView(
                       scrollDirection: Axis.horizontal,
                       children: [
                     Container(
                       width: 100,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                       },child: Text('T-Shirt')),
                     ),
                     SizedBox(width: 10,),
                     Container(
                       width: 100,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                       },child: Text('T-Shirt')),
                     ),
                     SizedBox(width: 10,),
                     Container(
                       width: 100,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                       },child: Text('T-Shirt')),
                     ),
                     SizedBox(width: 10,),
                     Container(
                       width: 100,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                       },child: Text('T-Shirt')),
                     )
                   ]),)


                ]),),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle button press
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => Filter())));
                            },
                            child: Row( // Use Row to create a row of icon and text
                              children: [
                                Icon(Icons.filter_list_outlined,color: Colors.black,), // Add the icon
                                SizedBox(width: 5), // Add spacing between icon and text
                                Text('Filters',style: TextStyle(color: Colors.black,fontSize: 11),), // Add the text
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle button press
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,// Use Row to create a row of icon and text
                            children: [
                              Icon(Icons.arrow_upward_outlined,color: Colors.black,),
                              Icon(Icons.arrow_downward_outlined,color: Colors.black,), // Add the icon
                              SizedBox(width: 5), // Add spacing between icon and text
                              Text('Price: lowest to high',style: TextStyle(color: Colors.black,fontSize: 11),), // Add the text
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterList(),));
                            },
                            child: Icon(Icons.menu))

                      ]),
                )
        ]),)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
    child: Column(children: [
        Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
            margin:EdgeInsets.all(5) ,
            child: Row(children: [
               Container(
                 width: 150,
                height: 100,
                child: Image.asset('assets/catalog1.png'),
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('Pull Over',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Mango',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey),),),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/rating.png'),),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Rs 300',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)
              ],)),

            ]),

          ),
        Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
          margin:EdgeInsets.all(5) ,
          child: Row(children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset('assets/catalog1.png'),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('Pull Over',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Mango',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey),),),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/rating.png'),),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Rs 300',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)
              ],)),

          ]),

        ),
        Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
          margin:EdgeInsets.all(5) ,
          child: Row(children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset('assets/catalog1.png'),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('Pull Over',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Mango',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey),),),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/rating.png'),),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Rs 300',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)
              ],)),

          ]),

        ),
        Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
          margin:EdgeInsets.all(5) ,
          child: Row(children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset('assets/catalog1.png'),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('Pull Over',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Mango',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.grey),),),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/rating.png'),),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Rs 300',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),)
              ],)),

          ]),

        ),

    ]),),
      )
    );
  }
}
