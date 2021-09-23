import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kTempTextStyle = TextStyle(
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(

  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const apiKey = '3506b98eb446d701af6219f8a7b1e496';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';
const Spinkit = SpinKitWave(
  color: Colors.blueGrey,
  size: 50.0,
);

final inputDecoration =  InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ) ,
    filled: true,
    fillColor: Color.fromARGB(200,158, 158, 158),//rgb(91, 101, 111),
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter The City',
    hintStyle: TextStyle(
      color: Colors.white70,
    ));
