import 'package:flutter/material.dart';
import 'package:flutter_asynchronous_api/screens/main_screen.dart';
import 'package:flutter_asynchronous_api/shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          color: Constants.mainColor,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}
