import 'package:flutter/material.dart';
import 'package:namer_app/classes/lits_item.dart';

class MixedListPage extends StatelessWidget {
  final List<ListItem> items;

  const MixedListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}