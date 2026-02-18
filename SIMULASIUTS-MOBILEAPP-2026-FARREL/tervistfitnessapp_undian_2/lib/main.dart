import 'package:flutter/material.dart';
import 'pages/food_database_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F9F9),
        fontFamily: 'Sans-serif',
        useMaterial3: true,
      ),
      home: const FoodDatabasePage(),
    );
  }
}