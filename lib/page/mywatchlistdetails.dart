// Credits For Ideas: James

import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlistmodel.dart';
import 'package:counter_7/page/mywatchlistpage.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:intl/intl.dart';


class MyWatchlistPageDetails extends StatefulWidget {
  MyWatchlistPageDetails({Key? key, required this.movie})
      : super(key: key);

  MyWatchlist movie;

  @override
  State<MyWatchlistPageDetails> createState() =>
      _MyWatchlistPageDetailsState(movie);
}

class _MyWatchlistPageDetailsState extends State<MyWatchlistPageDetails> {
  MyWatchlist movie;
  _MyWatchlistPageDetailsState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail WatchList'),
        ),
        drawer: const LabDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.fields.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Released Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMd('en_US').format(movie.fields.releaseDate),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${movie.fields.rating}/10")
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((movie.fields.watched) ? 'watched' : 'not watched')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Review: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.review)
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Route menu ke halaman form
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyWatchlistPage(),
                      ),
                    );
                  },
                  child: const Text("Back"))
            ],
          ),
        ));
  }
}