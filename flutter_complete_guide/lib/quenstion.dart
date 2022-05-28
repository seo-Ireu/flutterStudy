import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String quenstionText;

  Question(this.quenstionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          quenstionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
