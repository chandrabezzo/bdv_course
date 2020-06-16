import 'dart:io';
import 'package:bdvcourse/main_view.dart';
import 'package:bdvcourse/router.dart';
import 'package:bdvcourse/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locale = Locale("id");
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS) ? Application.ios(locale) : Application.android(locale, context);
  }
}

class Application {
  static Iterable<LocalizationsDelegate<dynamic>> _localizationsDelegates(){
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ];
  }

  static Iterable<Locale> _supportedLocales(){
    return [
      const Locale('id'),
      const Locale('en')
    ];
  }

  static Widget android(Locale locale, BuildContext context){
    return MaterialApp(
      locale: locale,
      localizationsDelegates: _localizationsDelegates(),
      supportedLocales: _supportedLocales(),
      theme: Styles.themeData(context),
      debugShowCheckedModeBanner: false,
      home: MainView(),
      onGenerateRoute: Router.generateRoute,
    );
  }

  static Widget ios(Locale locale){
    return CupertinoApp(
      locale: locale,
      localizationsDelegates: _localizationsDelegates(),
      supportedLocales: _supportedLocales(),
      initialRoute: MainView.routeName,
      onGenerateRoute: Router.generateRoute,
    );
  }
}