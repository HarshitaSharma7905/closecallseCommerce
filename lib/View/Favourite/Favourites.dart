import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Favorites',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: GestureDetector(onTap: () {
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
          bottom:PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Column(

                children: [

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
                            child: Row( // Use Row to create a row of icon and text
                              children: [
                                Icon(Icons.filter_list_outlined,color: Colors.black,), // Add the icon
                                SizedBox(width: 5), // Add spacing between icon and text
                                Text('Filters',style: TextStyle(color: Colors.black,fontSize: 11),), // Add the text
                              ],
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
                          Icon(Icons.menu)

                        ]),
                  )
                ]),)
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15),
            child:Wrap(children: [
              _productCart('url','Adidas','Black','L',Colors.red),
              _productCart('url','Adidas','Black','L',Colors.transparent),
              _productCart('url','Adidas','Black','L',Colors.transparent),
              _productCart('url','Adidas','Black','L',Colors.transparent),
              _productCart('url','Adidas','Black','L',Colors.red),
              _productCart('url','Adidas','Black','L',Colors.transparent),

            ]) ,
        ),
      ),


    );
  }
  Widget _productCart(String imageurl,String title,String color,String size,Color iconColor){
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: 165,
          height: 301,
          child: Column(
            children: [
              Container(
                height: 208,
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/Product/pimg2.png', scale: 1, fit: BoxFit.fitHeight),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(2),
                height: 18,
                child: Image.asset('assets/rating.png'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 15,
                child: Text('Mango', style: TextStyle(color: Colors.grey, fontSize: 11)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(2),
                height: 18,
                child: Text(title, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(2),
                height: 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Color: ' + color),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Size: ' + size),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(2),
                height: 20,
                child: Text('500', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Positioned(
         bottom: 85,
          right: 12,
          child: IconButton(
            icon: Container(

                decoration: BoxDecoration(shape: BoxShape.circle,color: iconColor),
                child: Icon(Icons.shopping_bag,color: iconColor==Colors.transparent?iconColor:Colors.white,)),
            onPressed: () {
              // Handle bag icon click here
            },
          ),
        ),
      ],
    );

  }
}
