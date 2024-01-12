import 'package:flutter/material.dart';

class ListLong extends StatelessWidget {
  const ListLong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final items =  List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
       appBar: AppBar(
          title: const Text('Long List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        )
    );
  }
}
