import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        margin: const EdgeInsets.symmetric(vertical: 250),
        height: 200,
        child:ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget> [
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
            Container(
              width: 160,
              color: Colors.yellow,
            ),
            Container(
              width: 160,
              color: Colors.orange
            ),
            Container(
              width: 160,
              color: Colors.purple,
            ),
            Container(
              width: 160,
              color: Colors.grey,
            ),
            
          ],
        )
      ),
    );
  }
}