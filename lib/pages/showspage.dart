import 'package:binarynumbers/api/api.dart';
import 'package:binarynumbers/models/searchdata.dart';
import 'package:binarynumbers/pages/showdetails.dart';
import 'package:binarynumbers/provider/movieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowsPage extends StatefulWidget {
  @override
  _ShowsPageState createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  Api api = Api();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    api.search(context);
    final mp = Provider.of<MovieProvider>(context);

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'NEW',
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 30),
            ),
          ),
          Container(
            height: height * 0.5,
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mp.itemCount,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ShowDetails(
                                imdbid: mp.searchlist[i].imdbid,
                              )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.39,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).disabledColor,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(mp.searchlist[i].poster),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -35),
                              child: Container(
                                  child: Container(
                                height: height * 0.08,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              )),
                            )
                          ],
                        )),
                  );
                }),
          ),
          //---------------------------------------------------------------------
          Container(
            child: Text(
              'POPULAR',
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 30),
            ),
          ),
          Container(
            height: height * 0.5,
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mp.searchlist.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ShowDetails(
                                imdbid: mp.searchlist[i].imdbid,
                              )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.39,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).disabledColor,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(mp.searchlist[i].poster),
                                      fit: BoxFit.fill)),
                            ),
                            Transform.translate(
                              offset: Offset(0, -35),
                              child: Container(
                                  child: Container(
                                height: height * 0.08,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'popular',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              )),
                            )
                          ],
                        )),
                  );
                }),
          ),
          //--------------------------------------------------------------
          Container(
            child: Text(
              'TRENDING LIST',
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 30),
            ),
          ),
          Container(
            height: height * 0.5,
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mp.searchlist.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ShowDetails(
                                imdbid: mp.searchlist[i].imdbid,
                              )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.39,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).disabledColor,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(mp.searchlist[i].poster),
                                      fit: BoxFit.fill)),
                            ),
                            Transform.translate(
                              offset: Offset(0, -35),
                              child: Container(
                                  child: Container(
                                height: height * 0.08,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'TOP 5',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              )),
                            )
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
