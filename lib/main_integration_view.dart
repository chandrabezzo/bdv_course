import 'package:bdvcourse/movie/movie_view.dart';
import 'package:bdvcourse/tv_show/tv_show_view.dart';
import 'package:flutter/material.dart';

class MainIntegrationView extends StatefulWidget {
  static const String routeName = '/main_integration';

  @override
  _MainIntegrationViewState createState() => _MainIntegrationViewState();
}

class _MainIntegrationViewState extends State<MainIntegrationView> {
  
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_selectedMenu],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedMenu,
        onTap: (index){
          setState(() {
            _selectedMenu = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text("Movie"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text("Tv Show")
          ),
        ],
      )
    );
  }

  List<Widget> _items = [
    MovieView(),
    TvShowView()
  ];
}
