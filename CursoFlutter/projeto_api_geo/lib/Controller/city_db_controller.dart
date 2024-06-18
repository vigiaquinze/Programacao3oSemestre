import '../Service/city_database_service.dart';
import '../Model/city_model.dart';

class CityDbController {
  List<City> _cities = [];
  final CityDbService _service = CityDbService();

  List<City> cities() => _cities;

  Future<List<City>> listCities() async {
    List<Map<String, dynamic>> maps = await _service.listCity();
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }

  Future<void> addCity(City city) async {
    await _service.insertCity(city);
    _cities.add(city); // Adiciona à lista local também
  }

  Future<void> updateCity(City city) async {
    await _service.updateCity(city);

    // Atualiza na lista local
    int index =
        _cities.indexWhere((element) => element.cityName == city.cityName);
    if (index != -1) {
      _cities[index] = city;
    }
  }

  Future<void> deleteCity(String city) async {
    await _service.deleteCity(city);
    _cities.removeWhere((element) => element.cityName == city);
  }

  Future<bool> isCityFavorite(String cityName) async {
    List<City> cities = await listCities();
    return cities
        .any((city) => city.cityName == cityName && city.favoritesCities);
  }
}
