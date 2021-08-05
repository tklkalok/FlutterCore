
import 'package:flutter/material.dart';
import 'package:flutter_core/components/movie_card.dart';
import 'package:flutter_core/models/movie.dart';
import 'package:flutter_core/providers/movie_provider.dart';
import 'package:flutter_core/screens/home/components/section_title.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class HotMovies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = context.read<MovieProvider>();
    movieProvider.fetchHotMovie();

    // List<Movie> _hotMovie = context.watch<MovieProvider>().hotMovie;

    return Column(
      children: [
        SectionTitle(
          text: 'Hot Movies', 
          press: (){}
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: MovieList(), 
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    // required this.movieList,
  }) : super(key: key);

  // final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    List<Movie> _hotMovie = context.watch<MovieProvider>().hotMovie;
    
    return Row(
      children: [
        ...List.generate(_hotMovie.length, 
          (index) {
            return MovieCard(movie: _hotMovie[index]); 
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }
}