import 'package:flutter/material.dart';
import 'WeatherApp/weather_model.dart';
import 'WeatherApp/weather_service.dart';
import 'WeatherApp/weather_ui.dart';

class WeatherProject extends StatelessWidget {
  const WeatherProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Current Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter City'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _searchWeather();
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16),
            if (_weather != null) WeatherDisplay(weather: _weather!),
          ],
        ),
      ),
    );
  }

  void _searchWeather() async {
    final apiKey = '910da9529735d66eaacc3a9fdf67315e'; // API key from OpenWeather
    final service = WeatherService(apiKey: apiKey);

    try {
      final weather = await service.getWeather(_controller.text);
      setState(() {
        _weather = weather as Weather?;
      });
    } catch (e) {
      // Handle error, e.g., show an error message
      print('Error: $e');
    }
  }
}