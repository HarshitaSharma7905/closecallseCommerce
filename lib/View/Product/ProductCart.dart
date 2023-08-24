import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  bool _boolSize=false;
  int selectedIndex = -1;
  bool _bool=false;
  int selectedSizeIndex=-1;
  List<String> sizes=['XS','S','M','L','XL','XXL'];

  String _selectedItem = 'Colors';
  List<String> _dropdownItems = ['Blue', 'Red', 'Green','Pink'];
   bool  _boolfav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.share,color: Colors.black,),)],
        title: Text('Short Dresses',style: TextStyle(color: Colors.black),),
        centerTitle: true,),
    body:GestureDetector(
      onTap: () {
        setState(() {
          _boolSize=false;
          _boolfav=false;
        });
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/Product/pimg1.png'),
                  Image.asset('assets/Product/pimg2.png'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                      width: 138,height: 40,
                      child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white)),onPressed: () {
                       setState(() {
                         _boolSize=true;
                       });
                  },child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Size',style: TextStyle(color: Colors.black,fontSize: 14)),
                      Icon(Icons.arrow_drop_down,color: Colors.black,)
                    ],
                  ),)),SizedBox(width: 10,),
                  Container(
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
                  Container(
                    height: 40,width: 40,
                    child: GestureDetector(
                        onTap: () {
                     setState(() {
                       _boolfav=true;
                     });
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('H&M',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
                      Text('₹19.99',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                    ],
                  ),
                  Text('Short black dress',style: TextStyle(color: Colors.grey,fontSize: 11),),
                  Image.asset('assets/rating.png'),SizedBox(height: 10,),
                  Text('Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                  style: TextStyle(fontSize: 14,color: Colors.black),),SizedBox(height: 15,),
                  Container(
                    width: 450,
                    height: 40,
                    child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {

                    },child: Text('Add To Cart')),
                  )
                ],
              ),
            )
          ],
        ),
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
            selectedIndex = index;
            _bool = false;
          });

        },child:  Text(label,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: textColor),)),
        ));
  }
}
