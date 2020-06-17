import 'package:bdvcourse/movie/movie.dart';
import 'package:bdvcourse/repository/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {

  MovieRepository _repository;
  List<Result> movies;
  List<ResultSearch> searchedMovies;

  MovieProvider({@required MovieRepository repository})
    : _repository = repository;

  Future<List<Result>> getMovies() async {
    final data = await _repository.discover();
    movies = data.results;
    notifyListeners();
    return movies;
  }

  Future<List<ResultSearch>> searchMovies(String query) async {
    final params = Map<String, dynamic>();
    params["query"] = query;

    final data = await _repository.search(params);
    searchedMovies = data.results;
    notifyListeners();
    return searchedMovies;
  }
}