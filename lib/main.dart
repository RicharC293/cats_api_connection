import 'package:cats_api_connection/screens/home_screen.dart';
import 'package:cats_api_connection/utils/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats App',
      routes: router,
      initialRoute: HomeScreen.routeName,
    );
  }
}
