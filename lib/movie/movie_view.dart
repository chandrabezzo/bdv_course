import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/movie/movie.dart';
import 'package:bdvcourse/movie/movie_search.dart';
import 'package:bdvcourse/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieView extends StatefulWidget {
  static const String routeName = '/movie';

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  List<Result> _allMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: MovieSearch()),
          )
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<MovieProvider>(context),
        child: Consumer<MovieProvider>(
          builder: (context, provider, _){
            if(_allMovies == null){
              provider.getMovies().then((value){
                _allMovies = value;
              });
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.separated(
                itemBuilder: (context, index){
                  final data = _allMovies[index];
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
                itemCount: _allMovies.length
              );
            }
          },
        ),
      ),
    );
  }
}
