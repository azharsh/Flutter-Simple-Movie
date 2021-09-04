import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovie/bloc/NowPlayingBloc.dart';
import 'package:fluttermovie/bloc/PopularMovieBloc.dart';
import 'package:fluttermovie/bloc/UpcomingMovieBloc.dart';
import 'package:fluttermovie/model/MovieResponse.dart';
import 'package:fluttermovie/network/environment.dart';

import '../DetailActivity.dart';

class ListMovie extends StatefulWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  _ListMovieState createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  final nowPlayingBloc = NowPlayingBloc();
  final popularMovieBloc = PopularMovieBloc();
  final upcomingMovieBloc = UpcomingMovieBloc();

  var nowPlayingResponse = <MovieModel>[];
  var popularResponse = <MovieModel>[];
  var upcomingResponse = <MovieModel>[];

  @override
  void initState() {
    super.initState();
    nowPlayingBloc.getNowPlaying();
    popularMovieBloc.getPopularMovie();
    upcomingMovieBloc.getUpcomingMovie();

    _nowPlayingStream();
    _popularStream();
    _upcomingStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Now Playing",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  child: new ListView.builder(
                    itemCount: nowPlayingResponse.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = nowPlayingResponse[index];
                      return Container(
                          width: 130,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailActivity(
                                    title: item.title,
                                    desc: item.overview,
                                    img: item.posterPath,
                                    id: item.id.toInt(),
                                    type: "movie",
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  IMG_URL + item.posterPath,
                                  height: 160,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.releaseDate.year.toString()),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                Text("Upcoming",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                        fontWeight: FontWeight.bold
                    )),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  child: new ListView.builder(
                    itemCount: upcomingResponse.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = upcomingResponse[index];
                      return Container(
                          width: 130,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailActivity(
                                    title: item.title,
                                    desc: item.overview,
                                    img: item.posterPath,
                                    id: item.id.toInt(),
                                    type: "movie",
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  IMG_URL + item.posterPath,
                                  height: 160,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.releaseDate.year.toString()),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                Text("Popular",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  child: new ListView.builder(
                    itemCount: popularResponse.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = popularResponse[index];
                      return Container(
                          width: 130,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailActivity(
                                    title: item.title,
                                    desc: item.overview,
                                    img: item.posterPath,
                                    id: item.id.toInt(),
                                    type: "movie",
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  IMG_URL + item.posterPath,
                                  height: 160,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.releaseDate.year.toString()),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void _nowPlayingStream() {
    nowPlayingBloc.nowPlaying.listen((value) {
      setState(() {
        nowPlayingResponse = value.results;
      });
    });
  }

  void _popularStream() {
    popularMovieBloc.popularMovie.listen((value) {
      setState(() {
        popularResponse = value.results;
      });
    });
  }

  void _upcomingStream() {
    upcomingMovieBloc.upcomingMovieGet.listen((value) {
      setState(() {
        upcomingResponse = value.results;
      });
    });
  }
}
