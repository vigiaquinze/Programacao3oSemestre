import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_db_controller.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/View/detailsweather_screen.dart';

import '../Model/city_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final WeatherController _weatherController = WeatherController();
  final CityDbController _dbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(hintText: "Enter the city name"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please enter a city";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _findCity(_cityController.text);
                    }
                  },
                  child: const Text("Search"),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: FutureBuilder<List<City>>(
                    future: _dbController.listCities(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text("Empty Location"));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].cityName),
                              onTap: () {
                                _navigateToDetails(snapshot.data![index].cityName);
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _findCity(String cityName) async {
    bool cityFound = await _weatherController.findCity(cityName);
    
    if (cityFound) {
      City cityToAdd = City(cityName: cityName, favoritesCities: false);
      await _dbController.addCity(cityToAdd);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City found"),
          duration: Duration(seconds: 1),
        ),
      );
      
      setState(() {
        // Refresh the list after adding the city
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City not found"),
          duration: Duration(seconds: 2),
        ),
      );
      _cityController.clear();
    }
  }

  void _navigateToDetails(String cityName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherDetailsScreen(cityName: cityName),
      ),
    );
  }
}
