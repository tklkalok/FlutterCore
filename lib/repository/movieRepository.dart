import 'package:flutter_core/helper/apiBaseHelper.dart';
import 'package:flutter_core/models/Movie.dart';

class MovieRepository {
  final String _apiKey = "c08afa626a05cf7de25629beac53947b";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get('/movie/popular?api_key=$_apiKey');
    return MovieResponse.fromJson(response).results;
  }
}