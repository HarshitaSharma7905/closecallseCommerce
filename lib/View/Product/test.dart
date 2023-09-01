// Column(
// children: [
// Container(
// height: 375,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: [
// Image.asset('assets/Product/pimg1.png'),
// Image.asset('assets/Product/pimg2.png'),
// ],
// ),
// ),
// Container(
// padding: EdgeInsets.all(10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
//
// width: 138,height: 40,
// child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white)),onPressed: () {
// setState(() {
// _boolSize=true;
// });
// },child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('Size',style: TextStyle(color: Colors.black,fontSize: 14)),
// Icon(Icons.arrow_drop_down,color: Colors.black,)
// ],
// ),)),SizedBox(width: 10,),
// Container(
// width: 138,height: 40,
// child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),child: Center(
// child: DropdownButton<String>(
// padding: EdgeInsets.all(10),
// style: TextStyle(
// backgroundColor: Colors.white // Remove underline decoration
// ),
// hint: Text(_selectedItem),
// items: _dropdownItems.map((String item) {
// return DropdownMenuItem<String>(
// value: item,
// child: Text(item),
//
// );
// }).toList(),
//
// onChanged: (value) {
// setState(() {
// _selectedItem=value.toString();
// });
// },),
// ),onPressed: () {
//
// },)),
// Container(
// height: 40,width: 40,
// child: GestureDetector(
// onTap: () {
// setState(() {
// _boolfav=true;
// });
// },
// child: Icon(Icons.favorite_border_outlined)),
// )
//
// ],
// ),
// ),
// Container(
// padding: EdgeInsets.all(15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('H&M',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
// Text('₹19.99',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
// ],
// ),
// Text('Short black dress',style: TextStyle(color: Colors.grey,fontSize: 11),),
// Image.asset('assets/rating.png'),SizedBox(height: 10,),
// Text('Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
// style: TextStyle(fontSize: 14,color: Colors.black),),SizedBox(height: 15,),
// Container(
// width: 450,
// height: 40,
// child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ,shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),onPressed: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) =>MyBag(),));
// },child: Text('Add To Cart')),
// )
// ],
// ),
// )
// ],
// ),