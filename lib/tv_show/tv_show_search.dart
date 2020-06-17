import 'dart:io';

import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/provider/tv_show_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvShowSearch extends SearchDelegate {
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
        value: Provider.of<TvShowProvider>(context),
        child: Consumer<TvShowProvider>(
          builder: (context, provider, _){
            if(provider.searchedTvShows == null){
              provider.searchTvShows(query);
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.separated(
                itemBuilder: (context, index){
                  final data = provider.searchedTvShows[index];
                  return ListTile(
                    title: Text(data.name),
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
                itemCount: provider.searchedTvShows.length
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