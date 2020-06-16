import 'package:flutter/material.dart';

class MainStateful extends StatefulWidget {
  static const String routeName = '/main_stateful';

  @override
  _MainStatefulState createState() => _MainStatefulState();
}

class _MainStatefulState extends State<MainStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainStateful'),
      ),
      body: ListView(children: <Widget>[
        RaisedButton(
          child: Text("Tes"),
          onPressed: () => {},
        )
      ]),
    );
  }
}
