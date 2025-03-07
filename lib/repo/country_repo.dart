import 'package:app_dev_spring25/countries/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryRepository {
  final String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/all'));

      if (response.statusCode == 200) {
        final List decodedJson = jsonDecode(response.body);
        return decodedJson
            .map<CountryModel>((json) => CountryModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}