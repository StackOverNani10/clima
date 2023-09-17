import 'package:clima/loading_screen.dart';
import 'package:clima/search_city_page.dart';
import 'package:flutter/material.dart';
import 'designs.dart';

class _HomePageState extends State<HomePage> {
  String temperature = '';
  String locationCity = '';
  String customIcon = '';
  String currentWeatherCityIcon = '';

  // Descomponemos el Wether
  void Ejemplo() {
    temperature = widget.weather["main"]["temp"].toStringAsFixed(0);
    locationCity = widget.weather["name"];
    customIcon = widget.weather["weather"][0]["main"];
    currentWeatherCityIcon = widget.weather["weather"][0]["icon"];
  }

  @override
  void initState() {
    Ejemplo();
    super.initState();
  }

  String customMessage() {
    double temp = double.parse(temperature);
    String kSummerTimeMsg = 'It\'s 🍦 time in ';
    String kWinterTimeMsg = 'It\'s time to wear 🧥🧤 in ';
    String kCloudTimeMsg = 'Keep your 🌂 close to you in ';
    String kDefaultTimeMsg = 'Stay informed of the weather in ';
    String kStormingTimeMsg = 'Stay safe and be careful with the ⚡️ in ';
    String kRainingTimeMsg = 'Dont\'t forget to take your 🌂 with you in ';
    String kColderTimeMsg = 'Only go out in case of emergency, suits on! 🧣🧤🧥🥾 in ';

    if (temp >= 25) {
      return kSummerTimeMsg;
    } else if (temp < 10 && temp >= 0) {
      return kWinterTimeMsg;
    } else if (temp < 0) {
      return kColderTimeMsg;
    } else if (customIcon == 'Rain') {
      return kRainingTimeMsg;
    } else if (customIcon == 'Thunderstorm') {
      return kStormingTimeMsg;
    } else if (customIcon == 'Clouds') {
      return kCloudTimeMsg;
    } else {
      return kDefaultTimeMsg;
    }
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoadingScreen();
                      }));
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 45.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchCityPage(
                          context: context,
                        );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${temperature}°',
                  style: kTempTextStyle,
                ),
                Image.network('https://openweathermap.org/img/wn/${currentWeatherCityIcon}@4x.png'),
              ],
            ),
            Text(
              '${customMessage()} ${locationCity}!',
              style: kMessageTextStyle,
              textAlign: TextAlign.center,
            ),
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
