import 'package:cats_api_connection/notifiers/home_notifier.dart';
import 'package:cats_api_connection/screens/home_screen.dart';
import 'package:cats_api_connection/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeNotifier()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Cats App',
          routes: router,
          initialRoute: HomeScreen.routeName,

          /// theme -> ThemeData.light()
          /// theme -> ThemeData.dark()
          /// Provider.of<HomeNotifier>(context).isDark -> accediendo al valor del notifier en la variable isDark
          // theme: Provider.of<HomeNotifier>(context).isDark
          //     ? ThemeData.dark()
          //     : ThemeData.light(),
          theme: context.watch<HomeNotifier>().isDark
              ? ThemeData.dark()
              : ThemeData.light(),
        );
      },
    );
  }
}
