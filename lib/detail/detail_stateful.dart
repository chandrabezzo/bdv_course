import 'package:flutter/material.dart';

class DetailStateful extends StatefulWidget {
  static const String routeName = '/detail_stateful';

  final Detail detail;
  
  DetailStateful(this.detail);

  @override
  _DetailStatefulState createState() => _DetailStatefulState();
}

class _DetailStatefulState extends State<DetailStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailStateful'),
      ),
      body: Column(children: <Widget>[
        Text(widget.detail.info),
        (widget.detail.optionalInfo != null) ? Text(widget.detail.optionalInfo) : Container()
      ]),
    );
  }
}

class Detail {
  final String info;
  final String optionalInfo;

  Detail(this.info, {this.optionalInfo});
}