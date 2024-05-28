import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  WeatherDetailsScreen({super.key, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  WeatherController _controller = new WeatherController();

  @override
  void initState() {
    super.initState();
    _controller.getWeather(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Weather Details',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
                future: _controller.getWeather(widget.cityName),
                builder: (context, snapshot) {
                  if (_controller.weatherList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_controller.weatherList.last.name),
                            IconButton(onPressed: (){
                              //adicionando aos favoritos
                              
                            },
                            icon: Icon(Icons.favorite_border))
                          ],
                        ),
                        Text(_controller.weatherList.last.description),
                        Text((_controller.weatherList.last.temp - 273)
                            .toStringAsFixed(2)),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
