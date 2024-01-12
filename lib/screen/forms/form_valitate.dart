import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode myFocusNode;
  // late FocusNode myFocusNode2;
  // late FocusNode myFocusNode3;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  // final myController3 = TextEditingController();
  // final myController4 = TextEditingController();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    // myFocusNode2 = FocusNode();
    // myFocusNode3 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    // myFocusNode2.dispose();
    // myFocusNode3.dispose();
    myController.dispose();
    myController2.dispose();
    // myController3.dispose();
    // myController4.dispose();

    super.dispose();
  }

  // void _printLatestValue() {
  //   final text = myController.text;
  //   print('Second text field: $text (${text.characters.length})');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term'),
                  autocorrect: true,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some';
                  }
                  return null;
                },
                focusNode: myFocusNode,
                controller: myController2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => FocusScope.of(context).nextFocus(),
            child: const Icon(Icons.edit),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              String textShow = 'Hola Mundo';
              if (!myFocusNode.hasFocus) {
                textShow = myController.text;
              }
              if (myFocusNode.hasFocus) {
                textShow = myController2.text;
              }

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(textShow),
                    );
                  });
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields),
          )
        ],
      ),
    );
  }
}
