import 'package:flutter/material.dart';
class CategorySearch extends StatefulWidget {
  const CategorySearch({Key? key}) : super(key: key);

  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Categories',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
      ),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 450,
                height: 48,
                child:  ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red.shade600) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

              },child: Text('VIEW ALL ITEMS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
              ),
              Container(
               alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 0,top: 20,right: 20),
                child: Text('Choose category',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Tops',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Shirts & Blouses',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Cardigans & Sweaters',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Knitwear',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Blazers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Outerwear',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Pants',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 15,right: 15),
                child: Text('Jeans',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Shorts',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Skirts',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 15,left: 40,top: 20,right: 20),
                child: Text('Dresses',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
              ),Divider(color: Colors.grey.shade200,height: 2,thickness: 2,indent: 2,endIndent: 2,),
            ],
          ),
        ),
      ) ,


    );
  }
}
