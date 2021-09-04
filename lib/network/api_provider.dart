import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:fluttermovie/model/ReviewResponse.dart';
import 'package:fluttermovie/model/TvResponse.dart';

import 'endpoint.dart';
import 'environment.dart';
import "package:http/http.dart" show Client, StreamedResponse;
import "package:http/http.dart" as http;



class ApiProvider {
  Client client = Client();

  Future<MovieResponse?> getPopularMovie() async {

    final response = await client.get(Uri.parse(POPULAR_MOVIE));

    try {
      if (response.statusCode == 200) {

        return MovieResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MovieResponse?> getNowPlaying() async {

    final response = await client.get(Uri.parse(NOW_PLAYING));

    try {
      if (response.statusCode == 200) {

        return MovieResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MovieResponse?> getUpComing() async {

    final response = await client.get(Uri.parse(UPCOMING_MOVIE));

    try {
      if (response.statusCode == 200) {

        return MovieResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<TvResponse?> getPopularTv() async {

    final response = await client.get(Uri.parse(POPULAR_TV));

    try {
      if (response.statusCode == 200) {

        return TvResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<TvResponse?> getNowTv() async {

    final response = await client.get(Uri.parse(POPULAR_TV));

    try {
      if (response.statusCode == 200) {

        return TvResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ReviewResponse?> getMovieReview(int id) async {

    final response = await client.get(Uri.parse(BASE_MOVIE + id.toString() + REVIEWS));

    try {
      if (response.statusCode == 200) {

        return ReviewResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<ReviewResponse?> getTvReview(int id) async {

    final response = await client.get(Uri.parse(BASE_TV + id.toString() + REVIEWS));

    try {
      if (response.statusCode == 200) {

        return ReviewResponse.fromJson(json.decode(response.body));
      } else {

        return throw Exception('Failed');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }



}