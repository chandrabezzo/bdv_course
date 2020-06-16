import 'package:bdvcourse/colors.dart';
import 'package:bdvcourse/detail/detail_stateful.dart';
import 'package:bdvcourse/router.dart';
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
      body: ListView.separated(
        itemBuilder: (context, index){
          final counter = index + 1;
          return ListTile(
            title: Text("Content #$counter"),
            subtitle: Text("SubContent #$counter"),
            leading: Icon(Icons.computer),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, Router.moveTo(DetailStateful(
              Detail("Flutter", optionalInfo: "Dart")
            ))),
          );
        }, 
        separatorBuilder: (context, index) => Divider(), 
        itemCount: 20
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
          child: Text("Detail", style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontSize: 18
          )),
          color: colorPrimary,
          padding: EdgeInsets.only(top: 12, bottom: 12),
          textColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, DetailStateful.routeName,
            arguments: Detail("Info Utama", optionalInfo: "Optional Info")),
        ),
      ),
    );
  }
}
