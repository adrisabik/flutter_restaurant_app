import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/restaurant.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  final Restaurant restaurant;

  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0, 
            vertical: 8.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(restaurant.pictureId),
              ),
              const SizedBox(height: 16),
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 16,
                  ),
                  Text(
                    restaurant.city,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                restaurant.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
            ],
          )
        )
      )
    );
  }
}