import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/detail_screen.dart';
import 'package:flutter_restaurant_app/restaurant.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: 
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0
                ),
                child: const Text(
                  'Recommended restaurants for you',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              FutureBuilder<String>(
                future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurantItem(context, restaurants[index]);
                      }
                    );
                },
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          restaurant.pictureId,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),   
      title: Text(
        restaurant.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      isThreeLine: true,
      subtitle: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 12,
              ),
              Text(
                restaurant.city,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.blue,
                size: 12,
              ),
              Text(
                restaurant.rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
      
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName, arguments: restaurant);
      },
    );
  }
}


