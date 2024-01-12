import 'package:flutter/material.dart';
import 'package:namer_app/classes/item_widget.dart';

class ListSapced extends StatelessWidget {
  const ListSapced({super.key});

  @override
  Widget build(BuildContext context) {
     const items = 6;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
              child:ConstrainedBox(
                constraints:BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    items, (index) => ItemWidget(text: 'Item $index')),
                ), 
            ) ,
          );
        },
      ),
    );
  }
}