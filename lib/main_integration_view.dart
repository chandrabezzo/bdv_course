import 'package:bdvcourse/colors.dart';
import 'package:bdvcourse/filter_integration_view.dart';
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
  bool _notifUpdate = false;

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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        backgroundColor: colorPrimary,
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            builder: (context) => FilterIntegrationView()
          );
        },
      ),
    );
  }

  List<Widget> _items = [
    MovieView(),
    TvShowView()
  ];
}
