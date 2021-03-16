import 'package:flutter/material.dart';
import 'package:skeleton/injector.dart';
import 'package:skeleton/screens/home_screen.dart';
import 'package:skeleton/router.dart' as Router;

void main() async {
  await setUpInjector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
