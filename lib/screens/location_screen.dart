import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import '../services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature = 0;
  int min = 0;
  int max = 0;
  int hum = 0;
  int wind = 0;
  String weatherIcon = "";
  String weatherMessage = "";
  String weatherDescription = " ";
  String description = "";
  String cityName = "";
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUi(weatherData: widget.locationWeather);
  }

  void updateUi({dynamic weatherData}) {
    //---to protect fro the error if there is no location or the data is not working-----//
    if (weatherData == null) {
      temperature = 0.toInt();
      weatherIcon = 'Error';
      weatherMessage = 'unable to get thw weather data';
      cityName = '';
      return;
    }
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      double mini = weatherData['main']['temp_min'];
      min = mini.toInt();
      double maxi = weatherData['main']['temp_max'];
      max = maxi.toInt();
      hum = weatherData['main']['humidity'];
      double windi = weatherData['wind']['speed'];
      wind = windi.toInt();

      //..............//
      weatherIcon = weather.getWeatherIcon(condition: condition);
      weatherMessage = weather.getMessage(temperature);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/H5 Flat Black Background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUi(weatherData: weatherData);
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 30.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CityScreen();
                          }));
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUi(weatherData: weatherData);
                          }
                        },
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Text(
                    '$cityName',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '$weatherIcon',
                            style: kConditionTextStyle,
                          ),
                          Text(
                            '$description',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            '$temperature°',
                            style: kTempTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'images/3741354_weather_wind_windy_icon.png',
                            height: 40,
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              '$wind' + '  ' + 'km/h',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'images/Forcast, humidity, precipitation, weather icon - Download on Iconfinder.png',
                            height: 40,
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              '$hum%',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'images/3741361_celcius_fahrenheit_thermometer_weather_icon.png',
                            height: 40,
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              '$min° / $max°',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
