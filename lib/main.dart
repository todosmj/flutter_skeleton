import 'package:flutter/material.dart';
import 'package:skeleton/constants/context.dart';
import 'package:skeleton/injector.dart';
import 'package:skeleton/screens/home_screen.dart';
import 'package:skeleton/router.dart' as Router;

import 'core/base_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 비동기 함수를 호출전 세팅

  await setUpInjector();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<Context>(
      builder: (context, snapshot, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: Router.onGenerateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        );
      }
    );
  }
}
