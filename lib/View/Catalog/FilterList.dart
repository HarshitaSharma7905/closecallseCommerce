import 'package:flutter/material.dart';

import 'Ctalogmain2.dart';

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<bool> _isCheckedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          'Brand',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(5),
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ),
            _checkboxWidget('Adidas', _isCheckedList[0], 0),
            _checkboxWidget('Nike', _isCheckedList[1], 1),
            _checkboxWidget('Puma', _isCheckedList[2], 2),
            _checkboxWidget('Reebok', _isCheckedList[3], 3),
          ],
        ),
      ),

      bottomSheet: Visibility(
        visible: true,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogmain2()));
                  },child: Text('APPLY')),
                )
              ]),
        ),
      ),
    );
  }

  // Checkbox widget
  Widget _checkboxWidget(String label, bool value, int index) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label),
          Checkbox(
            value: value,
            activeColor: Colors.red,
            onChanged: (bool? newValue) {
              setState(() {
                _isCheckedList[index] = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
