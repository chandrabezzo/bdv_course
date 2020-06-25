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

  MovieProvider _movieProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    _movieProvider = Provider.of(context); 
  }

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
            if(provider.movies == null){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.separated(
                itemBuilder: (context, index){
                  final data = provider.movies[index];
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
                    onTap: () => _movieProvider.searchMovies(data.title),
                  );
                }, 
                separatorBuilder: (context, index) => Divider(), 
                itemCount: provider.movies.length
              );
            }
          },
        ),
      ),
      bottomNavigationBar: RaisedButton(
        child: Text("API 1"),
        onPressed: () => _movieProvider.getMovies(),
      ),
    );
  }
}
