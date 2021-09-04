import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class NowPlayingBloc extends BaseBloc<MovieResponse> {
  Observable<MovieResponse> get nowPlaying => fetcher.stream;

  getNowPlaying() async {

    var result = await repository.getNowPlaying();
    fetcher.sink.add(result);
  }
}
