import 'dart:html';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> list=['lucknow','gkp','bombay'];
  String selectedlist= "city";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: () {

      },child: DropdownButton<String>(
        hint:Text(selectedlist),
        items: list.map((String city){
          return DropdownMenuItem<String>(value: city,child: Text(city),);
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedlist=value.toString();
          });

        },
      ),),

    );
  }
}
