import 'package:flutter/material.dart';

class DetailStateless extends StatelessWidget {

  final String info;
  final String optionalInfo;

  DetailStateless(this.info, {this.optionalInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Text(info),
        (optionalInfo != null) ? Text(optionalInfo) : Container()
      ]),
    );
  }
}