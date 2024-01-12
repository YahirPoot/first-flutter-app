import 'package:flutter/material.dart';
import 'package:namer_app/classes/lits_item.dart';

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall
      
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}
