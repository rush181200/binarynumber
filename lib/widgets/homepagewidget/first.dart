import 'package:binarynumbers/widgets/shared/inputdeco.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).highlightColor,
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Text(
                'Rushabh Mehta',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 18),
              ),
            ],
          ),
          Flexible(
              child: Container(
                  margin: EdgeInsets.only(left: 60, right: 40),
                  child: TextFormField(
                      style: TextStyle(color: Theme.of(context).disabledColor),
                      decoration: InputDeco.copyWith(
                          fillColor: Theme.of(context).primaryColor,
                          hintText: 'Search')))),
        ],
      ),
    );
  }
}
