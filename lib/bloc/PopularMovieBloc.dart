

import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class PopularMovieBloc extends BaseBloc<MovieResponse> {
  Observable<MovieResponse> get popularMovie => fetcher.stream;

  getPopularMovie() async {

    var result = await repository.getPopular();
    fetcher.sink.add(result);
  }
}
