import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/provider/tv_show_provider.dart';
import 'package:bdvcourse/tv_show/tv_show.dart';
import 'package:bdvcourse/tv_show/tv_show_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvShowView extends StatefulWidget {
  static const String routeName = '/tvShowView';

  @override
  _TvShowViewState createState() => _TvShowViewState();
}

class _TvShowViewState extends State<TvShowView> {

  List<Result> _allTvShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TvShow"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: TvShowSearch()),
          )
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<TvShowProvider>(context),
        child: Consumer<TvShowProvider>(
          builder: (context, provider, _){
            if(_allTvShow == null){
              provider.getTvShows().then((value){
                _allTvShow = value;
              });
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.separated(
                itemBuilder: (context, index){
                  final data = _allTvShow[index];
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
                itemCount: _allTvShow.length
              );
            }
          },
        ),
      ),
    );
  }
}
