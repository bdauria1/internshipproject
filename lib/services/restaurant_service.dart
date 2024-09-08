import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RestaurantService {
  static Future<List<String>> fetchRestaurants() async {
    final jsonString = await rootBundle.loadString('assets/restaurants.json');
    final List<dynamic> data = jsonDecode(jsonString);

    // Extract restaurant names from the JSON
    return data.map((restaurant) => restaurant['name'].toString()).toList();
  }
}