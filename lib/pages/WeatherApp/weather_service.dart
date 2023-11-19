import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  final String apiKey;
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String city) async {
    final Uri uri = Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String cityName = data['name'];
      final double temperature = data['main']['temp'];
      final String description = data['weather'][0]['description'];

      return Weather(city: cityName, temperature: temperature, description: description);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
