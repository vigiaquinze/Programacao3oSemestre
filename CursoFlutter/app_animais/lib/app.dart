import 'package:app_animais/controller.dart';
import 'package:app_animais/model.dart';
import 'package:app_animais/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaAnimaisApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(create: (context) => AnimalController(),
      child: ListaAnimaisTela(),
      ),
    );
  }
}