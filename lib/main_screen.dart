import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/detail_screen.dart';
import 'package:flutter_restaurant_app/restaurant.dart';
import 'dart:developer';

class MainScreen extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          log('data: ${snapshot.data}');
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurants[index]);
            }
          );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
        fit: BoxFit.cover,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName, arguments: restaurant);
      },
    );
  }
}


