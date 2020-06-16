import 'package:bdvcourse/main/main_stateful.dart';
import 'package:bdvcourse/main_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case MainView.routeName:
        return _routeTo(MainView());
      case MainStateful.routeName:
        return _routeTo(MainStateful());
      
      default:
        return _routeTo(MainView());
    }
  }

  static MaterialPageRoute<dynamic> _routeTo(Widget view){
    return MaterialPageRoute(builder: (_) => view);
  }
}