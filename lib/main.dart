import 'package:flutter/material.dart';
import 'crud.dart';
import 'getData.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: getData(),
  ));
}
