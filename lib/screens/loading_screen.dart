import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import '../utilities/constants.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
WeatherModel weatherModel = WeatherModel();
var weatherDatah = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather:weatherDatah,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Spinkit,
      ),
    );
  }
}
