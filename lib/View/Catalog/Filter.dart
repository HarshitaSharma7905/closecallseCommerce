import 'package:flutter/material.dart';


class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double _minPrice = 0;
  double _maxPrice = 100;
  bool _toshow=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Filters',style: TextStyle(color: Colors.black),),
        centerTitle: true,
              ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _toshow=false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.grey.shade200),
                alignment: Alignment.centerLeft,
                child: Text('Price Range',style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),
              SizedBox(height: 20,),
              Container(
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Container(
                             padding: EdgeInsets.only(left: 10,right: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                               Text('₹: $_minPrice',style: TextStyle(fontSize: 16),),
                               Text('₹: $_maxPrice',style: TextStyle(fontSize: 16)),
                             ]),
                           ),
                            Slider(
                              value: _minPrice,
                              min: 0,
                              max: 100,
                              activeColor: Colors.red,
                              inactiveColor:Colors.grey,
                              onChanged: (value) {
                                setState(() {
                                  _minPrice = value;
                                });

                              },
                            ),

                          ],
                        ),
              ),),
              Container(
                padding: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.grey.shade200),
                alignment: Alignment.centerLeft,
                child: Text('Colors',style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),
              Container(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red,width: 1),
                            ),
                          ),
                        ],
                      ),
                    ),Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red,width: 1),
                            ),
                          ),
                        ],
                      ),
                    ),Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red,width: 1),
                            ),
                          ),
                        ],
                      ),
                    ),Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red,width: 1),
                            ),
                          ),
                        ],
                      ),
                    ),Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo.shade800,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red,width: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///size---
              Container(
                padding: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.grey.shade200),
                alignment: Alignment.centerLeft,
                child: Text('Sizes',style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),

              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _sizeButton('XS',Colors.red,Colors.white),
                    _sizeButton('S',Colors.white,Colors.black),
                    _sizeButton('M',Colors.white,Colors.black),
                    _sizeButton('L',Colors.white,Colors.black),
                    _sizeButton('XL',Colors.white,Colors.black),
                  ],
                ),

              ),
              Container( padding: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.grey.shade200),
                alignment: Alignment.centerLeft,
                child: Text('Category',style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold))
              ),
             Container(
               padding: EdgeInsets.all(15),
               child: Wrap(
                 spacing: 15,
                 runSpacing: 15,
                 alignment: WrapAlignment.center,
                 children: [
                   _buildButton('All', Colors.red,Colors.white),
                   _buildButton('Women', Colors.white,Colors.black),
                   _buildButton('Men', Colors.white,Colors.black),
                   _buildButton('Girl', Colors.white,Colors.black),
                   _buildButton('Boy', Colors.white,Colors.black),
                 ],
               ),
             ),


            ],
          ),
        ),
      ),
     //bottom sheet
      bottomSheet: Visibility(
        visible: _toshow,
        child: Container(
          height: 100,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Container(
              width: 100,
              height: 40,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.transparent) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)))),onPressed: () {
                Navigator.pop(context);
              },child: Text('DISCARD',style: TextStyle(color: Colors.black),)),
            ),
            Container(
              width: 100,
              height: 40,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)))),onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogmain2()));
              },child: Text('APPLY')),
            )
          ]),
        ),
      ),
     persistentFooterButtons: [
       Container(
         height: 60,
         padding: EdgeInsets.all(10),
         decoration: BoxDecoration(color: Colors.grey.shade200),
         alignment: Alignment.centerLeft,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Brand',
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Text(
                   'adidas Originals, Jack & Jones, s.Oliver',
                   style: TextStyle(
                     fontSize: 11,
                     color: Colors.grey,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
             IconButton(
               icon: Icon(Icons.arrow_forward_ios),
               onPressed: () {
                 setState(() {
                   _toshow=true;
                 });
                 // Handle back button press
               },
             ),
           ],
         ),
       ),
     ],
    );
  }
  //Size Button
  Widget _sizeButton(String label,Color color,Color textColor){
    return  Container(
      height:40 ,
      width:60 ,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Center(child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),onPressed: () {

      },child:  Text(label,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: textColor),)),
    ));
  }
  //button
  Widget _buildButton(String label, Color color,Color textColors) {
    return Container(
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          // Handle button press

        },
        child: Text(
          label,
          style: TextStyle(fontSize: 14,color: textColors),
        ),
      ),
    );
  }
}



