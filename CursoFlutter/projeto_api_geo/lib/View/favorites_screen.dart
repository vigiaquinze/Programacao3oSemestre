import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_db_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final CityDbController _dbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: FutureBuilder(
          future: _dbController.listCities(),
          builder: (context, AsyncSnapshot<List<City>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No favorite cities yet."));
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              List<City> favoritesCities = snapshot.data!;
              return ListView.builder(
                itemCount: favoritesCities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(favoritesCities[index].cityName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _dbController.deleteCity(favoritesCities[index].cityName);
                        setState(() {
                          favoritesCities.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
