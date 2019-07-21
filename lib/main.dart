import 'package:flutter/material.dart';
import 'package:sample_fltr/main_page/main_page.dart';

//import 'package:sample_fltr/quiz_app/home.dart';
//import 'app.dart';
//import 'radial_button/radial_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}
