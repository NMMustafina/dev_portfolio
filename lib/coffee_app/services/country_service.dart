import 'dart:convert';

import 'package:http/http.dart' as http;

class CountryService {
  Future<List<String>> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data
          .map((country) => country['name']['common'].toString())
          .toList()
        ..sort();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
