import 'package:flutter/material.dart';

class ScrollViewDemo extends StatelessWidget {
  const ScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title:Text(title),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,

          ),
          SliverList(
            delegate:SliverChildBuilderDelegate(
              (context,index)=>ListTile(title:Text('Item #$index'),
              
            ),
            childCount: 1000,
          )
          )
        ],
      ),
    );
  }
}