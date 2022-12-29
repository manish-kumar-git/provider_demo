import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Count with Provider"),),
      body: Column(
        children: [
          CupertinoActivityIndicator()
        ],
      ),
    );
  }
}
