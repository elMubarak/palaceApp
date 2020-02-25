import 'package:flutter/material.dart';
import 'package:fluttershare/models/const.dart';
import 'package:fluttershare/route_generator.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        accentColor: kAccentColor,
      ),

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
