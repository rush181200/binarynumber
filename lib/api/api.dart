import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:binarynumbers/api/baseurl.dart';
import 'package:binarynumbers/models/searchdata.dart';
import 'package:binarynumbers/provider/movieprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;

import 'baseapi.dart';
import 'baseurl.dart';

class Api extends Baseapi {
  BaseUrl url = BaseUrl();

  @override
  // ignore: missing_return
  Future<Search> search(BuildContext context) async {
    final show = Provider.of<MovieProvider>(context);
    var response = await retry(
      () => http.get(url.baseurl).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    var convert = json.decode(response.body);
    show.remove();
    for (int i = 0; i < convert['Search'].length; i++) {
      show.addshows(
          imdbid: convert['Search'][i]['imdbID'],
          title: convert['Search'][i]['Title'],
          year: convert['Search'][i]['Year'],
          poster: convert['Search'][i]['Poster'],
          type: convert['Search'][i]['Type']);
    }
  }
}
