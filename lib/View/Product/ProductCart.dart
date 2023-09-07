import 'package:closecallsecommerce/View/MyBag/MyBag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCart extends StatefulWidget {
  final String collection1;
  final String collection2;
  final String uid1;
  final String uid2;
  final String title;
  const ProductCart({Key? key, required this.collection1, required this.collection2, required this.uid1, required this.uid2, required this.title}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  bool _boolSize=false;
  int selectedIndex = -1;
  bool _bool=false;
  int selectedSizeIndex=-1;
  List<String> sizes=['XS','S','M','L','XL','XXL'];
  String size ="Select Size";

  String _selectedItem = 'Colors';
  List<String> _dropdownItems = ['Blue', 'Red', 'Green','Pink'];
   bool  _boolfav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.share,color: Colors.black,),)],
        title: Text(widget.title,style: TextStyle(color: Colors.black),),
        centerTitle: true,),
    body:GestureDetector(
      onTap: () {
        setState(() {
          _boolSize=false;
          _boolfav=false;
        });
      },
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection(widget.collection1).doc(widget.uid1).collection(widget.collection2).doc(widget.uid2).get(),
          builder: (context, snapshot) {
           Map<String,dynamic> document= snapshot.data?.data() as Map<String,dynamic>;
           return Column(
             children: [
               Container(
                 height: 375,
                 child: ListView(
                   scrollDirection: Axis.horizontal,
                   children: [
                     Image.network(document['image']),
                     Image.network(document['image']),
                   ],
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Expanded(
                       child: Container(

                           width: 138,height: 40,
                           child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white)),onPressed: () {
                             setState(() {
                               _boolSize=true;
                             });
                           },child:
                               Container(
                                   width: 345,
                                   child: Text(size,style: TextStyle(color: Colors.black,fontSize: 14))),

                            )),
                     ),SizedBox(width: 10,),
                     Expanded(
                       child: Container(
                           width: 138,height: 40,
                           child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),child: Center(
                             child: DropdownButton<String>(
                               padding: EdgeInsets.all(10),
                               style: TextStyle(
                                   backgroundColor: Colors.white // Remove underline decoration
                               ),
                               hint: Text(_selectedItem),
                               items: _dropdownItems.map((String item) {
                                 return DropdownMenuItem<String>(
                                   value: item,
                                   child: Text(item),

                                 );
                               }).toList(),

                               onChanged: (value) {
                                 setState(() {
                                   _selectedItem=value.toString();
                                 });
                               },),
                           ),onPressed: () {

                           },)),
                     ),
                     Container(
                       height: 40,width: 40,
                       child: GestureDetector(
                           onTap: () async {
                             SharedPreferences prefer=await SharedPreferences.getInstance();
                             String? customerUdi=prefer.getString('uid');
                             String col1=widget.collection1;
                             String id1=widget.uid1;
                             String col2=widget.collection2;
                             String productId=snapshot.data!.id;
                            FirebaseFirestore.instance.collection('customer').doc(customerUdi).
                            collection('favourite').add({'col1':col1,'col2':col2,'id1':id1,'productID':productId}).whenComplete(() =>ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Added to Favourite successfully "),
                            )) );

                           },
                           child: Icon(Icons.favorite_border_outlined)),
                     )

                   ],
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(document['title'],maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
                         Text('₹'+document['price'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                       ],
                     ),
                     Text('Short black dress',style: TextStyle(color: Colors.grey,fontSize: 11),),
                     Image.asset('assets/rating.png'),SizedBox(height: 10,),
                     Text(document['description'],
                       style: TextStyle(fontSize: 14,color: Colors.black),),SizedBox(height: 15,),
                     Container(
                       width: 450,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () async{
                        SharedPreferences prefer=await SharedPreferences.getInstance();
                         String? customerUdi=prefer.getString('uid');
                         String col1=widget.collection1;
                         String id1=widget.uid1;
                         String col2=widget.collection2;
                         String productId=snapshot.data!.id;
                         String productSize=size;
                         String productColor=_selectedItem;
                         
                         await FirebaseFirestore.instance.
                         collection('customer').doc(customerUdi).collection('cart').
                         add({"col1":col1,'col2':col2,'id1':id1,'productId':productId,'productSize':productSize,'productColor':productColor,'quantity':1}).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("Added to cart successfully "),
                         )));
                         

                         // Navigator.push(context, MaterialPageRoute(builder: (context) =>MyBag(),));
                       },child: Text('Add To Cart')),
                     ),
                     SizedBox(height: 20,),
                     Container(
                       width: 450,
                       height: 40,
                       child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () async{
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBag()));


                         // Navigator.push(context, MaterialPageRoute(builder: (context) =>MyBag(),));
                       },child: Text('View Cart')),
                     )
                   ],
                 ),
               )
             ],
           );
          },
        )
      ),
    ),bottomSheet: Container(
      height: 300,
      child: Column(
        children: [
          Visibility(
            visible: _boolSize,
            child: Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Select Size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 16.0, // Adjust the spacing between items
                      children: List.generate(sizes.length, (index) {
                        return Container(
                          width: 100, // Adjust the width as needed
                          color: selectedSizeIndex == index ? Colors.red : null,
                          padding: EdgeInsets.all(16.0),
                          child: _sizeButton(
                            index,sizes[index], selectedIndex == index ? Colors.red : Colors.white, selectedIndex == index ? Colors.white : Colors.black,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _boolfav,
          child:  Container(

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 16.0, // Adjust the spacing between items
                    children: List.generate(sizes.length, (index) {
                      return Container(
                        width: 100, // Adjust the width as needed
                        color: selectedSizeIndex == index ? Colors.red : null,
                        padding: EdgeInsets.all(16.0),
                        child: _sizeButton(
                          index,sizes[index], selectedIndex == index ? Colors.red : Colors.white, selectedIndex == index ? Colors.white : Colors.black,
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                  },child: Text('Add to Favourite')),
                )
              ],
            ),
          ),

          )
        ],
      ),
    ),
    );

  }
  Widget _sizeButton(int index,String label,Color color,Color textColor){
    return  Container(
        height:40 ,
        width:60 ,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Center(child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),onPressed: () {
          setState(() {
            selectedSizeIndex = index;
            size=sizes[selectedSizeIndex];

            _bool = false;

          });

        },child:  Text(label,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: textColor),)),
        ));
  }
}
