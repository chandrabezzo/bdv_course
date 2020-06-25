import 'package:bdvcourse/main/main_stateful.dart';
import 'package:bdvcourse/main/main_stateless.dart';
import 'package:bdvcourse/main_integration_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  static const String routeName = '/main';

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Main View"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.movie_creation),
              onPressed: () => Navigator.pushNamed(context, MainIntegrationView.routeName),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.yellow,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.info),
                text: "Info",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MainStateful(),
            MainStateless()
          ]
        ),
      ),
    );
  }
}
