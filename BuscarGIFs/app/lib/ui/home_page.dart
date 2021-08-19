import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String? _search = null;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      Uri requestTrending = Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=qCEu3iQmCaq5dN1zXkcqPG1wIKpuMolR&limit=20&rating=g");

      response = await http.get(requestTrending);
    } else {
      Uri requestSearch = Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=qCEu3iQmCaq5dN1zXkcqPG1wIKpuMolR&q=${_search}&limit=20&offset=${_offset}&rating=g&lang=pt");

      response = await http.get(requestSearch);
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((data) => print(data));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
