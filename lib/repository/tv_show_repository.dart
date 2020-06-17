import 'package:bdvcourse/endpoints.dart';
import 'package:bdvcourse/tv_show/tv_show.dart';
import 'package:dio/dio.dart';

class TvShowRepository {
  Future<TvShowResponse> discover() async {
    try {
      final responJson = await Dio().get(Endpoints.TV_SHOWS);
      print(responJson);
      final response = TvShowResponse.fromJson(responJson.data);
      return (response != null) ? response : null;
    } on DioError catch(error){
      print(error);
      return null;
    }
  }

  Future<SearchTvShowResponse> search(Map<String, dynamic> params) async {
    try {
      final responJson = await Dio().get(Endpoints.SEARCH_TV_SHOW, queryParameters: params);
      print(responJson);
      final response = SearchTvShowResponse.fromJson(responJson.data);
      return (response != null) ? response : null;
    } on DioError catch(error){
      print(error);
      return null;
    }
  }
}