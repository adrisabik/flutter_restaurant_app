import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/detail_screen.dart';
import 'package:flutter_restaurant_app/main_screen.dart';
import 'package:flutter_restaurant_app/restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
      }
    );
  }
}
