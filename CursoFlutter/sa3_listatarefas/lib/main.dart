import 'package:flutter/material.dart';

import 'View/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SA3",
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
    );
  }
}
