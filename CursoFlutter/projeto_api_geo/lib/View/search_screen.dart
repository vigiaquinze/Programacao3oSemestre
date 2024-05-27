import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/View/detailsweather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buscar cidade")),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                        labelText: "Insira o nome da cidade:"),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Por favor, insira o nome da cidade";
                          }
                          return null;
                        },
                  ),
                  ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherDetailsScreen(
                            city: _cityController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Buscar'),
                )
                ],
              ),
            ),
          )),
    );
  }
}
