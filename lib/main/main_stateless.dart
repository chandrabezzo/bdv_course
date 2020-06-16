import 'package:bdvcourse/detail/detail_stateless.dart';
import 'package:bdvcourse/router.dart';
import 'package:flutter/material.dart';

class MainStateless extends StatelessWidget {

  static const String routeName = '/main_stateful';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2
        ), 
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text("Tes"),
              subtitle: Text("tes"),
              onTap: () => Navigator.push(context, Router.moveTo(DetailStateless("Info",
                optionalInfo: "Optional"))),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}