
import 'package:fluttermovie/model/ReviewResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class MovieReviewsBloc extends BaseBloc<ReviewResponse> {
  Observable<ReviewResponse> get movieReviewGet => fetcher.stream;

  getMovieReviewsBloc(int id) async {

    var result = await repository.getMovieReviews(id);
    fetcher.sink.add(result);
  }
}
