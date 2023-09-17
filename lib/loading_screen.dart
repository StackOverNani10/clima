import 'package:clima/home_page.dart';
import 'package:clima/location.dart';
import 'package:clima/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }

  void getData() async {

    Location currentPosition = Location();
    await currentPosition.getCurrentPosition();

    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&appid=a410af637674f02a36506bc8aaed14b4&units=metric';

    // Instanciamos un objeto de tipo weather
    Weather currentWeather = Weather(url);
    var weatherData = await currentWeather.getWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(weather: weatherData);
    }));

    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
