Container(
margin: EdgeInsets.all(5),
height: 120,
color: Colors.grey.shade200,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(
width: 120,
child: Image.asset('assets/Product/pimg1.png',fit: BoxFit.fitWidth),
),
Container(
padding: EdgeInsets.all(15),
alignment: Alignment.centerLeft,
width: 150,
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Adidas",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
Container(
padding: EdgeInsets.only(top: 5),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text('Color :'),
Text(color,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
],),
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text('Size :'),
Text(size,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
],)
],),
),
Container(
padding: EdgeInsets.only(top: 10),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
child: Center(child: Icon(Icons.add,color: Colors.black,))),
Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
child: Center(child: Text('1',style: TextStyle(color: Colors.black),))),
Container(height: 30,width: 30,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
child: Center(child: Icon(Icons.remove,color: Colors.black,))),
],),
)
]),
),
Container(
padding: EdgeInsets.all(15),
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Icon(Icons.more_vert,color: Colors.black),
Text('₹500',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
]),
),
]),
);