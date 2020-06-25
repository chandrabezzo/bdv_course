import 'package:flutter/material.dart';

class AwesomeViewPage extends StatefulWidget {
  static const String routeName = '/awesomeView';

  @override
  _AwesomeViewPageState createState() => _AwesomeViewPageState();
}

class _AwesomeViewPageState extends State<AwesomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AwesomeView'),
      ),
      body: Text("Tes"),
    );
  }
}
