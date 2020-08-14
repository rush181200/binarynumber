import 'package:binarynumbers/models/searchdata.dart';
import 'package:flutter/cupertino.dart';

class MovieProvider with ChangeNotifier {
  List<Search> searchlist = [];

  List<Search> get searchmap => searchlist;

  int get itemCount {
    return searchlist.length;
  }

  addshows({
    String title,
    String year,
    String imdbid,
    String type,
    String poster,
  }) {
    searchlist.add(Search(
      imdbid: imdbid,
      poster: poster,
      title: title,
      type: type,
      year: year,
    ));
    notifyListeners();
  }

  void remove() {
    searchlist.clear();
    notifyListeners();
  }
}
