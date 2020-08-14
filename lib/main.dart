import 'package:binarynumbers/pages/home.dart';
import 'package:binarynumbers/pages/nointernet.dart';
import 'package:binarynumbers/provider/movieprovider.dart';
import 'package:binarynumbers/widgets/colorss.dart';
import 'package:binarynumbers/widgets/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: MovieProvider())],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: myColor[200], // black
            accentColor: myColor[100], //white
            highlightColor: myColor[600], //red button
            disabledColor: myColor[500],
            hintColor: myColor[800],
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen()),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final Connect c = Connect();
  Animation<double> animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        Tween<double>(begin: 300, end: -100).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
    _check().then((value) => s());
  }

  Future s() async {
    await c.check()
        ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Home()))
        : Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => NoInternet()));
  }

  Future<bool> _check() async {
    await Future.delayed(Duration(milliseconds: 5000));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.9),
                Theme.of(context).primaryColor.withOpacity(0.9),
                Theme.of(context).primaryColor
              ])),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Transform.translate(
                    offset: Offset(0, animation.value),
                    child: Container(
                      margin: EdgeInsets.only(left: 60, right: 60),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.red,
                            child: Text(
                              'Binary Numbers',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
