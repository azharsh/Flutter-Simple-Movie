import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:fluttermovie/model/ReviewResponse.dart';
import 'package:fluttermovie/model/TvResponse.dart';
import 'package:fluttermovie/network/api_provider.dart';

class Repository {

  final apiProvider = ApiProvider();

  Future<MovieResponse?> getNowPlaying() => apiProvider.getNowPlaying();

  Future<MovieResponse?> getPopular() => apiProvider.getPopularMovie();

  Future<MovieResponse?> getUpcoming() => apiProvider.getUpComing();

  Future<TvResponse?> getPopularTv() => apiProvider.getPopularTv();

  Future<TvResponse?> getOnAir() => apiProvider.getNowTv();

  Future<ReviewResponse?> getMovieReviews(int id) => apiProvider.getMovieReview(id);

  Future<ReviewResponse?> getTvReviews(int id) => apiProvider.getTvReview(id);

}