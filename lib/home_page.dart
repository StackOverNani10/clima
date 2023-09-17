import 'package:flutter/material.dart';
import 'designs.dart';
import 'loading_screen.dart';
import 'search_city_page.dart';

class _HomePageState extends State<HomePage> {
  String currentTemperature = '';
  String currentLocationCity = '';
  String currentIconCity = '';
  String cityTemperature = '';
  String locationCity = '';

  // Descomponemos el Wether
  void Ejemplo() {
    currentTemperature = widget.weather["main"]["temp"].toString();
    currentLocationCity = widget.weather["name"];
    //currentIconCity = widget.weather["weather"]["icon"].toString();
    //cityTemperature = widget.cityWeather["main"]["temp"].toString();
    //locationCity = widget.cityWeather["name"];
  }

  @override
  void initState() {
    Ejemplo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/location_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 45.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SearchCityPage();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 45.0,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              currentTemperature,
              style: kTempTextStyle,
            ),
            Text('It\'s time in ${currentLocationCity}!',
                style: kMessageTextStyle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weather});

  var weather;

  @override
  State<HomePage> createState() => _HomePageState();
}
