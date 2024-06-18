import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  Future<void> _getWeather() async {
    try {
      Position _position = await Geolocator.getCurrentPosition();
      _controller.getWeatherbyLocation(_position.latitude, _position.longitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previsão do Tempo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: const Text("Favorites"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Text("Localization"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  if (_controller.weatherList.isEmpty) {
                    return Column(
                      children: [
                        Text("Localização Não Encontrada"),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            _getWeather();
                          },
                        ),
                      ],
                    );
                  } else {
                    var weather = _controller.weatherList.last;
                    return Column(
                      children: [
                        Text(
                          weather.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24, // Exemplo de tamanho de fonte maior
                          ),
                        ),
                        Text(weather.main),
                        Text(weather.description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Temperature:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text(
                              (weather.temp - 273.15).toStringAsFixed(2),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Max:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text(
                              (weather.tempMax - 273.15).toStringAsFixed(2),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Min:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text(
                              (weather.tempMin - 273.15).toStringAsFixed(2),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            _getWeather();
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
