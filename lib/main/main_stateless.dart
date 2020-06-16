import 'package:flutter/material.dart';

class MainStateless extends StatelessWidget {

  static const String routeName = '/main_stateful';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Text("tes"),
    );
  }
}