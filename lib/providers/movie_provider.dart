import 'package:flutter/material.dart';
import 'package:flutter_core/models/movie.dart';
import '../helper/apiBaseHelper.dart';

class MovieProvider extends ChangeNotifier {
  ApiBaseHelper _api = new ApiBaseHelper();
  final String _apiKey = "c08afa626a05cf7de25629beac53947b";
  List<Movie> _hotMovie = [];

  void init(){}

  void fetchHotMovie() async{
    try {
      final response = await _api.get('/movie/top_rated?api_key=$_apiKey');
      _hotMovie = MovieResponse.fromJson(response).results;
      notifyListeners();
    }catch (e){
      print(e);
    }
  }

  List<Movie> get hotMovie{
    return _hotMovie;
  }
}