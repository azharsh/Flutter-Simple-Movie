import 'package:fluttermovie/model/TvResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class PopularTvBloc extends BaseBloc<TvResponse> {
  Observable<TvResponse> get popularTvGet => fetcher.stream;

  getPopularTv() async {

    var result = await repository.getPopularTv();
    fetcher.sink.add(result);
  }
}
