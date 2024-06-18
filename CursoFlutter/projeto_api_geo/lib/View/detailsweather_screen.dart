import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Controller/city_db_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;

  WeatherDetailsScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  WeatherController _controller = WeatherController();
  CityDbController _dbController = CityDbController();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavorite();
    _controller.getWeather(widget.cityName);
  }

  Future<void> _checkFavorite() async {
    List<City> cities = await _dbController.listCities();
    setState(() {
      isFavorite = cities.any(
          (city) => city.cityName == widget.cityName && city.favoritesCities);
    });
  }

  Future<void> _toggleFavorite() async {
    // Verifica se a cidade já está marcada como favorita
    bool isCityFavorite = await _dbController.isCityFavorite(widget.cityName);

    // Alterna entre adicionar e remover da lista de favoritos
    if (isCityFavorite) {
      await _dbController
          .updateCity(City(cityName: widget.cityName, favoritesCities: false));
    } else {
      await _dbController
          .updateCity(City(cityName: widget.cityName, favoritesCities: true));
    }

    // Atualiza o estado para refletir a mudança
    setState(() {
      isFavorite = !isCityFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Weather Details',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: _controller.getWeather(widget.cityName),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!_controller.weatherList.isNotEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  var weatherData = _controller.weatherList.last;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weatherData.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              _toggleFavorite();
                            },
                            icon: isFavorite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(weatherData.description),
                      SizedBox(height: 10),
                      Text(
                        'Temperature:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${(weatherData.temp - 273.15).toStringAsFixed(2)} °C',
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
