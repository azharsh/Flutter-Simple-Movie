import 'package:flutter/material.dart';
import 'package:fluttermovie/bloc/MovieReviewsBloc.dart';
import 'package:fluttermovie/bloc/TvReviewsBloc.dart';
import 'package:fluttermovie/model/ReviewResponse.dart';
import 'package:fluttermovie/network/environment.dart';

class DetailActivity extends StatefulWidget {
  const DetailActivity(
      {Key? key,
      required this.title,
      required this.desc,
      required this.img,
      required this.id,
      required this.type})
      : super(key: key);

  final String title;
  final String desc;
  final String img;
  final int id;
  final String type;

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  final movieReviewBloc = MovieReviewsBloc();
  final tvReviewBloc = TvReviewsBloc();

  var reviewResponse = <ReviewModel>[];

  @override
  void initState() {
    super.initState();
    if (widget.type == "movie") {
      movieReviewBloc.getMovieReviewsBloc(widget.id);
      _movieReviewsStream();
    } else if (widget.type == "tv") {
      tvReviewBloc.getTvReviewsBloc(widget.id);
      _tvReviewsStream();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  IMG_URL + widget.img,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(widget.title,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16,
                ),
                Text(widget.desc,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 16,
                ),
                Text("Reviews",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 400,
                  child: new ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviewResponse.length,
                    itemBuilder: (context, index) {
                      var item = reviewResponse[index];
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(item.author,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(item.content,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _movieReviewsStream() {
    movieReviewBloc.movieReviewGet.listen((value) {
      setState(() {
        reviewResponse = value.results;
        print(value.results);
      });
    });
  }

  void _tvReviewsStream() {
    tvReviewBloc.tvReviewsGet.listen((value) {
      setState(() {
        reviewResponse = value.results;
        print(value.results);
      });
    });
  }
}
