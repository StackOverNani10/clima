import 'package:clima/api_key.dart';
import 'package:clima/home_page.dart';
import 'package:clima/location.dart';
import 'package:clima/weather.dart';
import 'package:flutter/material.dart';

class SearchCityPage extends StatelessWidget {
  SearchCityPage({super.key, required this.context});

  BuildContext context;
  String _valueTextField = '';

  void getData() async {
    var cityName = _valueTextField;

    Location currentPosition = Location();
    await currentPosition.getCurrentPosition();

    final cityUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric';

    // Instanciamos un objeto de tipo weather
    Weather currentCityWeather = Weather(cityUrl);
    var cityData = await currentCityWeather.getWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(weather: cityData);
    }));

    print(cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text('Search Weather'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: Icon(
                Icons.location_city,
                size: 30.0,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a city name',
                  labelText: 'City',
                ),
                onChanged: (value) {
                  _valueTextField = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                getData();
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
