import 'package:binarynumbers/models/searchdata.dart';
import 'package:flutter/material.dart';

abstract class Baseapi {
  Future<Search> search(BuildContext context);
}
