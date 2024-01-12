import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, ((index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        })),
      ),
    );
  }
}
