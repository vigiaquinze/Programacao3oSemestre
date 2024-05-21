import 'package:flutter/material.dart';
import 'package:projeto_api_geo/View/detailsweather_screen.dart';
import 'package:projeto_api_geo/View/favorites_screen.dart';
import 'package:projeto_api_geo/View/home_screen.dart';
import 'package:projeto_api_geo/View/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Projeto API GEO", home: HomeScreen(), routes: {
      '/home': (context) => HomeScreen(),
      '/favorites': (context) => FavoritesScreen(),
      '/search': (context) => SearchScreen(),
    });
  }
}
