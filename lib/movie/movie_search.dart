import 'dart:io';

import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearch extends SearchDelegate {
  
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
    return ChangeNotifierProvider.value(
        value: Provider.of<MovieProvider>(context),
        child: Consumer<MovieProvider>(
          builder: (context, provider, _){
            provider.searchMovies(query);
            if(provider.searchedMovies == null){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.separated(
                itemBuilder: (context, index){
                  final data = provider.searchedMovies[index];
                  return ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.overview, maxLines: 3, overflow: TextOverflow.ellipsis),
                    leading: Container(
                      width: 60,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("${Endpoints.IMAGE}${data.posterPath}"),
                      ),
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => Divider(), 
                itemCount: provider.searchedMovies.length
              );
            }
          },
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  } 
}