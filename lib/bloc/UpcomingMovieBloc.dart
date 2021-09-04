import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class UpcomingMovieBloc extends BaseBloc<MovieResponse> {
  Observable<MovieResponse> get upcomingMovieGet => fetcher.stream;

  getUpcomingMovie() async {

    var result = await repository.getUpcoming();
    fetcher.sink.add(result);
  }
}
