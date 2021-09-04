import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:fluttermovie/model/TvResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class OnAirBloc extends BaseBloc<TvResponse> {
  Observable<TvResponse> get onAirGet => fetcher.stream;

  getOnAirBloc() async {

    var result = await repository.getOnAir();
    fetcher.sink.add(result);
  }
}
