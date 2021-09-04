import 'package:flutter/material.dart';
import 'package:fluttermovie/bloc/OnairBloc.dart';
import 'package:fluttermovie/bloc/PopularTvBloc.dart';
import 'package:fluttermovie/model/TvResponse.dart';
import 'package:fluttermovie/network/environment.dart';

import '../DetailActivity.dart';

class ListTv extends StatefulWidget {
  const ListTv({Key? key}) : super(key: key);

  @override
  _ListTvState createState() => _ListTvState();
}

class _ListTvState extends State<ListTv> {
  final onAirBloc = OnAirBloc();
  final popularTvBloc = PopularTvBloc();

  var onAirResonse = <TvModel>[];
  var popularResponse = <TvModel>[];

  @override
  void initState() {
    super.initState();
    onAirBloc.getOnAirBloc();
    popularTvBloc.getPopularTv();

    _onAirStream();
    _popularStream();
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
                Text("On Air",
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
                    itemCount: onAirResonse.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = onAirResonse[index];
                      return Container(
                          width: 130,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailActivity(
                                    title: item.name,
                                    desc: item.overview,
                                    img: item.posterPath,
                                    id: item.id.toInt(),
                                    type: "tv",
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
                                  item.name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.firstAirDate.year.toString()),
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
                        fontWeight: FontWeight.bold)),
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
                                    title: item.name,
                                    desc: item.overview,
                                    img: item.posterPath,
                                    id: item.id.toInt(),
                                    type: "tv",
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
                                  item.name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.firstAirDate.year.toString()),
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

  void _onAirStream() {
    onAirBloc.onAirGet.listen((value) {
      setState(() {
        onAirResonse = value.results;
      });
    });
  }

  void _popularStream() {
    popularTvBloc.popularTvGet.listen((value) {
      setState(() {
        popularResponse = value.results;
      });
    });
  }
}
