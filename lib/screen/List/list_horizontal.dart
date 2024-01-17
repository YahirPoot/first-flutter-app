import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 250),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                  width: 160, color: Colors.red, child: Text('Color Red')),
              Container(
                  width: 160, color: Colors.blue, child: Text('Color Blue')),
              Container(
                  width: 160, color: Colors.green, child: Text('Color Green')),
              Container(
                  width: 160,
                  color: Colors.yellow,
                  child: Text('Color Yellow')),
              Container(
                
                  width: 160,
                  color: Colors.orange,
                  child: Text('Color Orange')),
              Container(
                  width: 160,
                  color: Colors.purple,
                  child: Text('Color Purple')),
              Container(
                  width: 160, color: Colors.grey, child: Text('Color Grey')),
            ],
          )),
    );
  }
}
