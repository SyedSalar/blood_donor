import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  AlertBox({super.key, required this.text, required this.body});
  String text;
  String body;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        body: AlertDialog(
      title: Text(text),
      content: Text(body),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    )));
  }
}
