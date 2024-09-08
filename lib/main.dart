import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/restaurant_provider.dart';

void main() {
  runApp(
    // Wrap the app with ProviderScope to allow access to Riverpod providers
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant List',
      home: RestaurantListScreen(),
    );
  }
}

class RestaurantListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the restaurantProvider to get the list of restaurants
    final restaurantAsyncValue = ref.watch(restaurantProvider);
    // Watch the searchProvider to get the current search query
    final searchQuery = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search restaurants...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Update the searchProvider state when the text changes
                ref.read(searchProvider.notifier).state = value;
              },
            ),
          ),
        ),
      ),
      body: restaurantAsyncValue.when(
        data: (restaurants) {
          // Filter the restaurants based on the search query
          final filteredRestaurants = restaurants
              .where((restaurant) =>
              restaurant.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          return ListView.builder(
            itemCount: filteredRestaurants.length,
            itemBuilder: (context, index) {
              // Build a ListTile for each filtered restaurant
              return ListTile(
                title: Text(filteredRestaurants[index]),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()), // Show a loading spinner while data is loading
        error: (error, stack) => Center(child: Text('Error: $error')), // Show an error message if something goes wrong
      ),
    );
  }
}