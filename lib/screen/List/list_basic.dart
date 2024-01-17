import 'package:flutter/material.dart';

class BasicList extends StatelessWidget {
  const BasicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic List'),
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontFamily: AutofillHints.birthday,
            color: Colors.black),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              color: Colors.blue,
            ),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.blue,
            ),
            title: Text('Account'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album_outlined, color: Colors.blue),
            title: Text('Photo Album'),
          ),
        ],
      ),
    );
  }
}
