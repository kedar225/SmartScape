import 'dart:convert';
import 'package:http/http.dart' as http;

class AirQualityRepository {
  final String apiKey;

  AirQualityRepository({required this.apiKey});

  Future<int?> getAirQualityData({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.airvisual.com/v2/nearest_city?lat=$latitude&lon=$longitude&key=$apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['current']['pollution']['aqius'];
    } else {
      throw Exception('Failed to load air quality data');
    }
  }
}
