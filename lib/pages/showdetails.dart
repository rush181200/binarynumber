import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:binarynumbers/provider/movieprovider.dart';

class ShowDetails extends StatelessWidget {
  final String imdbid;
  const ShowDetails({
    Key key,
    this.imdbid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final mp = Provider.of<MovieProvider>(context)
        .searchlist
        .firstWhere((element) => element.imdbid == imdbid);
    return Scaffold(
      appBar: AppBar(
        title: Text(mp.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(mp.poster), fit: BoxFit.fill)),
            )
          ],
        ),
      ),
    );
  }
}
