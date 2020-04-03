import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose Location',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
          child: Text('Button pressed $num times'),
          onPressed: () {
            setState(() {
              num += 1;
            });
          }),
    );
  }
}
