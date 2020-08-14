import 'package:binarynumbers/pages/home.dart';
import 'package:binarynumbers/pages/nointernet.dart';
import 'package:binarynumbers/provider/movieprovider.dart';
import 'package:binarynumbers/widgets/colorss.dart';
import 'package:binarynumbers/widgets/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _SplashScreenState extends State<SplashScreen> {
  final Connect c = Connect();

  @override
  void initState() {
    super.initState();

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
    await Future.delayed(Duration(milliseconds: 4000));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text('Binary Numbers'))),
    );
  }
}
