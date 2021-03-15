import 'package:flutter/material.dart';
import 'package:quipumarket/pages/demo/DemoPage.dart';
import 'package:quipumarket/pages/home/HomePage.dart';
import 'package:quipumarket/pages/market/MarketPage.dart';
import 'package:quipumarket/theme/DarkTheme.dart';
import 'package:quipumarket/theme/Theme.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quipu Market',
      initialRoute: 'home',
      routes: {
        'home' : ( BuildContext context ) => HomePage(),
        'market' : ( BuildContext context ) => MarketPage(),
        'demo' : ( BuildContext context ) => DemoPage(),
      },
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
