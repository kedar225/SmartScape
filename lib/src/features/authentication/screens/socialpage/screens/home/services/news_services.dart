import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/models/news_article.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/services/location_services.dart';


class NewsService {
  static const String apiKey = 'ADD_YOUR_NEWS_API';
  static const String baseUrl = 'https://newsapi.org/v2';
  final LocationService _locationService = LocationService();

  Future<Map<String, dynamic>> getLocalNews() async {
    try {
      // Get current city
      final String city = await _locationService.getCurrentCity();

      // Fetch news for the city
      final response = await http.get(
        Uri.parse('$baseUrl/everything?q=$city&apiKey=$apiKey&pageSize=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return {
          'city': city,
          'articles':
              articles.map((article) => NewsArticle.fromJson(article)).toList(),
        };
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      rethrow;
    }
  }
}
