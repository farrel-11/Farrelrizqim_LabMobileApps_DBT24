import 'package:flutter/material.dart';

class EmptyMealPage extends StatelessWidget {
  const EmptyMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Meal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: Text('Tak disuruh, jadi tak de halaman')),
    );
  }
}