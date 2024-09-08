import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/restaurant_service.dart';

// Provider for fetching restaurant list
final restaurantProvider = FutureProvider<List<String>>((ref) async {
  return await RestaurantService.fetchRestaurants();
});

// Provider for managing the search filter (StateProvider for a String)
final searchProvider = StateProvider<String>((ref) => "");