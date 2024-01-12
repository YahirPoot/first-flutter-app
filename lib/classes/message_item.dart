import 'package:flutter/material.dart';
import 'package:namer_app/classes/lits_item.dart';

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
