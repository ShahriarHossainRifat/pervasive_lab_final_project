import 'package:flutter/cupertino.dart';
import 'weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weather.city}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Temperature: ${weather.temperature}°C',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 8),
        Text(
          'Description: ${weather.description}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
