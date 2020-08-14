import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'No Internet',
          style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
