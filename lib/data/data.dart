import 'package:counter_7/model/mywatchlistmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchlist>> fetchMyWatchlist() async {
        var url = Uri.parse('https://tugas2pbpjoshuanadeak.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<MyWatchlist> listMyWatchlist = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchlist.add(MyWatchlist.fromJson(d));
        }
        }

        return listMyWatchlist;
    }