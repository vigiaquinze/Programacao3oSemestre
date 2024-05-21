import 'package:projeto_api_geo/Model/weather_model.dart';
import 'package:projeto_api_geo/Service/weather_service.dart';

class WeatherController {
  final List<Weather> _weatherList = [];
  //get
  List<Weather> get weatherList => _weatherList;

  final WeatherService _service = new WeatherService();
  //métodos
  //busca por cidade
  Future<void> getWeather(String city) async {
    try {
      Weather weather = Weather.fromJSON(await _service.getWeather(city));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }
  //busca por latitude e longitude
  Future<void> getWeatherByLocation(double lat, double lon) async {
    try {
      Weather weather = Weather.fromJSON(await _service.getWeatherByLocation(lat, lon));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }
}