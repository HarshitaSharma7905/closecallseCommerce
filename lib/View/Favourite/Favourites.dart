import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late SharedPreferences prefers;
  late final String customeruid;
  Future<void> _sharedpreference() async{
    prefers = await  SharedPreferences.getInstance();
    setState(() {
      customeruid=prefers.getString('uid')!;
    });

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sharedpreference();
  }
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
             StreamBuilder<QuerySnapshot>
               (
               stream: FirebaseFirestore.instance.collection('customer').doc(customeruid).collection('favourite').snapshots(),
               builder: (context, snapshot) {
                List<DocumentSnapshot> document = snapshot.data!.docs;
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                      document.length,
                          (index) {
                            Map<String,dynamic> data = document[index].data() as Map<String,dynamic>;
                            String col1 = data['col1'];
                            String col2 = data['col2'];
                            String id1 = data['id1'];
                            String productId = data['productId'];
                            return FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance.collection(col1).doc(id1).collection(col2).doc(productId).get(),
                              builder: (context, snapshot) {
                                Map<String,dynamic> productData= snapshot.data?.data() as Map<String,dynamic>;


                                String title = productData['title'];
                                int maxCharacters = 10; // Show the first 10 characters

                                String shortenedTitle = title.length > maxCharacters
                                    ? title.substring(0, maxCharacters)
                                    : title;
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
                                            child: Image.network(productData['image'], scale: 1, fit: BoxFit.fitHeight),
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
                                            child: Text(shortenedTitle, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                          ),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.all(2),
                                            height: 20,
                                            child: Text(productData['price'], style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                );

                              },
                            );
                          }),
                );

               },
             )

            ]) ,
        ),
      ),


    );
  }

}
