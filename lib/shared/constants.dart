import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static const mainColor = Color(0xffd57dad);
  static const headerStyle = TextStyle(fontSize: 24);
  static const errorStyle = TextStyle(fontSize: 24, color: Colors.red);
  static const searchTextInputDecoration = InputDecoration(
    hintText: 'Search',
    contentPadding: EdgeInsets.all(12),
    border: InputBorder.none,
  );
}
