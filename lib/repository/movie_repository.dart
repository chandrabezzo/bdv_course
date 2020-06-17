import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/movie/movie.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  Future<MovieResponse> discover() async {
    try {
      final responJson = await Dio().get(Endpoints.MOVIES);
      print(responJson);
      final response = MovieResponse.fromJson(responJson.data);
      return (response != null) ? response : null;
    } on DioError catch(error){
      print(error);
      return null;
    }
  }

  Future<SearchMovieResponse> search(Map<String, dynamic> params) async {
    try {
      final responJson = await Dio().get(Endpoints.SEARCH_MOVIES, queryParameters: params);
      print(responJson);
      final response = SearchMovieResponse.fromJson(responJson.data);
      return (response != null) ? response : null;
    } on DioError catch(error){
      print(error);
      return null;
    }
  }
}