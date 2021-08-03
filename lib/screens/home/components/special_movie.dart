
import 'package:flutter/material.dart';
import 'package:flutter_core/bloc/movieBloc.dart';
import 'package:flutter_core/components/movie_card.dart';
import 'package:flutter_core/models/apiResponse.dart';
import 'package:flutter_core/models/movie.dart';
import 'package:flutter_core/screens/home/components/section_title.dart';

import '../../../size_config.dart';

class SpecialMovies extends StatefulWidget {
  const SpecialMovies({
    Key? key,
    // required this.MovieData,
  }) : super(key: key);

  // final Map<String, dynamic> MovieData;

  @override
  _SpecialMoviesState createState() => _SpecialMoviesState();
}

class _SpecialMoviesState extends State<SpecialMovies> {
  late MovieBloc _bloc;

  @override
  void initState(){
    super.initState();
    _bloc = MovieBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Special Movies', 
          press: (){}
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<ApiResponse<List<Movie>>>(
            stream: _bloc.movieListStream,
            builder: (context, snapshot){
              if(snapshot.hasData){
                switch(snapshot.data!.status){
                  case Status.LOADING:
                    return Column(
                      children: [
                        Text('Loading'),
                        Text(
                          snapshot.data?.message ?? 'Loading'
                        ),
                      ],
                    );
                  case Status.ERROR:
                    return Column(
                      children: [
                        Text('Error'),
                        Text(
                          snapshot.data?.message ?? 'Error'
                        ),
                      ],
                    );
                  case Status.COMPLETED:
                    // print(snapshot.data?.data);
                    return MovieList(movieList: snapshot.data!.data);
                }
              }
              return Container();
            }
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(movieList.length, 
          (index) {
            return MovieCard(movie: movieList[index]); 
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }
}