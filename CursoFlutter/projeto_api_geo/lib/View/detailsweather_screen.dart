import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String city;
  WeatherDetailsScreen({required this.city});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}