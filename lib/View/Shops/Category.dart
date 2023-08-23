import 'package:closecallsecommerce/View/Shops/Category/Women.dart';
import 'package:closecallsecommerce/View/Shops/CategorySearch.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Category();
  }
}

class _Category extends StatefulWidget {
  const _Category({Key? key}) : super(key: key);

  @override
  State<_Category> createState() => _CategoryState();
}

class _CategoryState extends State<_Category> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: () {


        },child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Categories',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.all(20),child: GestureDetector(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategorySearch()));
            },
            child: Icon(Icons.search,color: Colors.black,)),)],
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.red,
            tabs: [
              Tab(child: Text('Women',style: TextStyle(color: Colors.black),)),
              Tab(child: Text('Men',style: TextStyle(color: Colors.black))),
              Tab(child: Text('Kids',style: TextStyle(color: Colors.black))),
            ]),
      ),
      body: TabBarView(
          controller: _tabController,

          children: [
            Women(),
            Text('Men'),
            Text('Kids')
          ]),
    );
  }
}


