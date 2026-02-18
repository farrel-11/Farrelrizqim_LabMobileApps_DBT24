import 'package:flutter/material.dart';
import 'empty_meal_page.dart';
import 'selected_food_page.dart';

class FoodDatabasePage extends StatefulWidget {
  const FoodDatabasePage({super.key});

  @override
  State<FoodDatabasePage> createState() => _FoodDatabasePageState();
}

class _FoodDatabasePageState extends State<FoodDatabasePage> {
  bool isEggSelected = false;

  void _showFoodLoggedSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Food logged',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                "If you'd like to make edits, click view to make changes",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectedFoodPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('View', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F9), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Food Database',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextField(
              cursorColor: Colors.black, 
              decoration: InputDecoration(
                hintText: 'Describe what you ate',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyMealPage())),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_note, size: 24),
                    SizedBox(width: 8),
                    Text('Log empty meal', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Recently logged', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text(
              "You haven't uploaded any food. Here are our frequently added food",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            const SizedBox(height: 25),
            const FoodItemCard(title: 'White Rice', calories: '135 cal · serving', isSelected: false),
            const SizedBox(height: 12),
            FoodItemCard(
              title: 'Egg',
              calories: '74 cal · large',
              isSelected: isEggSelected,
              onCardTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectedFoodPage()),
                );
              },
              onAddTap: () {
                setState(() => isEggSelected = true);
                _showFoodLoggedSheet(context);
              },
            ),
            const SizedBox(height: 12),
            const FoodItemCard(title: 'Fried Tofu', calories: '35 cal · piece', isSelected: false),
          ],
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String title;
  final String calories;
  final bool isSelected;
  final VoidCallback? onAddTap;
  final VoidCallback? onCardTap;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.calories,
    required this.isSelected,
    this.onAddTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white, 
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected ? [] : [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, 
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black, 
                      fontSize: 18, 
                      fontWeight: FontWeight.w500
                    )
                  ),
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, 
                        size: 16, 
                        color: isSelected ? Colors.white : Colors.black
                      ),
                      const SizedBox(width: 4),
                      Text(calories, 
                        style: TextStyle(
                          color: isSelected ? Colors.white70 : Colors.black87, 
                          fontSize: 15
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.done_all, color: Colors.white)
            else
              GestureDetector(
                onTap: onAddTap,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F9F9),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Icon(Icons.add, color: Colors.black, size: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}