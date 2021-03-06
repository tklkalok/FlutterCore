import 'dart:async';
import 'package:flutter_core/models/apiResponse.dart';
import 'package:flutter_core/models/movie.dart';
import 'package:flutter_core/repository/movieRepository.dart';

class MovieBloc {
  late MovieRepository _movieRepository;
  late StreamController<ApiResponse<List<Movie>>> _movieListController;

  MovieBloc(){
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();                              
    fetchMovieList();
  }

  StreamSink<ApiResponse<List<Movie>>> get movieListSink => _movieListController.sink;
  Stream<ApiResponse<List<Movie>>> get movieListStream => _movieListController.stream;

  fetchMovieList() async{
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try{
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    }catch (e){
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose(){
    _movieListController.close();
  }
}