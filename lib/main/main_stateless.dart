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
          crossAxisCount: 3,
          childAspectRatio: 1
        ), 
        itemBuilder: (context, index){
          return Card(
            elevation: 2,
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