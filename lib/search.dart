import 'dart:io';

import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: (Platform.isIOS)
        ? Icon(Icons.arrow_back_ios)
        : Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        final counter = index + 1;
        return ListTile(
          title: Text("Result #$counter"),
          subtitle: Text("Sub Result #$counter"),
          onTap: () => Navigator.pop(context),
        );
      }, 
      separatorBuilder: (context, index) => Divider(), 
      itemCount: 20
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        final counter = index + 1;
        return ListTile(
          title: Text("Suggest #$counter"),
          subtitle: Text("Sub Suggest $counter"),
          onTap: () => Navigator.pop(context),
        );
      }, 
      separatorBuilder: (context, index) => Divider(), 
      itemCount: 20
    );
  }
}