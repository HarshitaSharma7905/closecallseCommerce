import 'package:closecallsecommerce/View/Profile/Orders/Deliverd.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          backgroundColor: Colors.white,
          actions: [Padding(padding: EdgeInsets.all(20),child: Icon(Icons.search,color: Colors.black,),)],
          bottom:PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text('My Orders',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)),
                  ),
                  TabBar(controller: _tabController,
                      indicatorColor: Colors.red,
                      tabs: [
                        Tab(child: Text('Delivered',style: TextStyle(color: Colors.black),)),
                        Tab(child: Text('Processing',style: TextStyle(color: Colors.black))),
                        Tab(child: Text('Cancelled',style: TextStyle(color: Colors.black))),
                      ]),
                ],
              ))
      ),body: TabBarView(
        controller:_tabController,
        children: [
          Delivered(),
          Text('Processing'),
          Text('Cancelled'),
    ]),

    );
  }
}


