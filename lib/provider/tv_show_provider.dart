import 'package:bdvcourse/repository/tv_show_repository.dart';
import 'package:bdvcourse/tv_show/tv_show.dart';
import 'package:flutter/material.dart';

class TvShowProvider extends ChangeNotifier {

  TvShowRepository _repository;
  List<Result> tvShows;
  List<ResultSearch> searchedTvShows;

  TvShowProvider({@required TvShowRepository repository})
    : _repository = repository;

  Future<List<Result>> getTvShows() async {
    final data = await _repository.discover();
    tvShows = data.results;
    notifyListeners();
    return tvShows;
  }

  Future<List<ResultSearch>> searchTvShows(String query) async {
    final params = Map<String, dynamic>();
    params["query"] = query;

    final data = await _repository.search(params);
    searchedTvShows = data.results;
    notifyListeners();
    return searchedTvShows;
  }
}