import 'package:binarynumbers/pages/nointernet.dart';
import 'package:binarynumbers/provider/movieprovider.dart';
import 'package:binarynumbers/widgets/connectivity.dart';
import 'package:binarynumbers/widgets/homepagewidget/first.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookmark.dart';
import 'fav.dart';
import 'showspage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _widgetOptions = <Widget>[Home1(), Favourite(), Bookmark()];
  int _currentSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool connects = false;

  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState.openDrawer()
        : setState(() {
            _currentSelected = index;
          });
  }

  @override
  void initState() {
    checked();
    super.initState();
  }

  Future checked() async {
    final Connect c = Connect();
    var co = await c.check();
    setState(() {
      connects = co;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final mp = Provider.of<MovieProvider>(context);
    return mp == null
        ? Container(
            margin: EdgeInsets.only(
                top: height * 0.35,
                bottom: height * 0.35,
                left: width * 0.3,
                right: width * 0.3),
            height: height * 0.05,
            width: width * 0.05,
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).highlightColor),
            ),
          )
        : SafeArea(
            child: connects
                ? Scaffold(
                    backgroundColor: Theme.of(context).primaryColor,
                    key: _drawerKey,
                    body: _widgetOptions.elementAt(_currentSelected),
                    drawer: Drawer(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Center(
                            child: Text(
                          'Drawer',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        )),
                      ),
                    ),
                    bottomNavigationBar: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(color: Theme.of(context).hintColor)
                      ]),
                      child: BottomNavigationBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        type: BottomNavigationBarType.fixed,
                        onTap: _onItemTapped,
                        currentIndex: _currentSelected,
                        showUnselectedLabels: true,
                        unselectedItemColor: Colors.grey[800],
                        selectedItemColor: Theme.of(context).highlightColor,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            title: Text(''),
                            icon: Icon(
                              Icons.home,
                              size: 35,
                            ),
                          ),
                          BottomNavigationBarItem(
                            title: Text(''),
                            icon: Icon(
                              Icons.star,
                              size: 35,
                            ),
                          ),
                          BottomNavigationBarItem(
                            title: Text(''),
                            icon: Icon(
                              Icons.bookmark,
                              size: 35,
                            ),
                          ),
                          BottomNavigationBarItem(
                            title: Text(''),
                            icon: Icon(
                              Icons.line_weight,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : NoInternet(),
          );
  }
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                First(),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: TabBar(
                      indicatorPadding: EdgeInsets.all(20),
                      unselectedLabelColor: Theme.of(context).accentColor,
                      labelColor: Theme.of(context).accentColor,
                      indicator: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(10)),
                      tabs: [
                        Tab(
                          child: Text(
                            'Movies',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text('Shows',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Tab(
                          child: Text('Music',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ]),
                ),
                Container(
                  height: height * 1.7,
                  width: width,
                  child: Container(
                    child: TabBarView(children: [
                      Container(
                        child: Center(
                            child: Text('Movies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor))),
                      ),
                      Container(child: ShowsPage()),
                      Container(
                        child: Center(
                            child: Text('Music',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor))),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
