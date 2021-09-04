
import 'package:fluttermovie/model/ReviewResponse.dart';

import 'package:rxdart/rxdart.dart';
import 'base.dart';


class TvReviewsBloc extends BaseBloc<ReviewResponse> {
  Observable<ReviewResponse> get tvReviewsGet => fetcher.stream;

  getTvReviewsBloc(int id) async {

    var result = await repository.getTvReviews(id);
    fetcher.sink.add(result);
  }
}
