import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import package SVG

class SelectedFoodPage extends StatefulWidget {
  const SelectedFoodPage({super.key});

  @override
  State<SelectedFoodPage> createState() => _SelectedFoodPageState();
}

class _SelectedFoodPageState extends State<SelectedFoodPage> {
  final TextEditingController _servingController = TextEditingController(text: "1");
  bool _isLogVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Selected food', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text('Egg', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text('Measurement', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMeasurementChip('Large', isSelected: true),
                      _buildMeasurementChip('Medium'),
                      _buildMeasurementChip('G'),
                      _buildMeasurementChip('Small'),
                    ],
                  ),
                  
                  const SizedBox(height: 25),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Number of Servings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Container(
                        width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _servingController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onTap: () => setState(() => _isLogVisible = true),
                                onChanged: (value) {
                                  if (!_isLogVisible) setState(() => _isLogVisible = true);
                                },
                                decoration: const InputDecoration(border: InputBorder.none),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(Icons.edit, size: 14, color: Colors.black54),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.local_fire_department, color: Colors.black),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calories', style: TextStyle(color: Colors.grey, fontSize: 14)),
                            Text('74', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      _buildNutrientSmallCard('Protein', '6g', 'assets/drumstick.svg', const Color(0xFFE57373)),
                      const SizedBox(width: 10),
                      _buildNutrientSmallCard('Carbs', '0g', 'assets/wheat.svg', const Color(0xFF81C784)),
                      const SizedBox(width: 10),
                      _buildNutrientSmallCard('Fats', '4g', 'assets/avocado.svg', const Color(0xFF81C784)),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text('Other nutrition facts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),

                  _buildNutritionRow('Saturated Fat', '1g'),
                  _buildNutritionRow('Polyunsaturated Fat', '0.00g'),
                  _buildNutritionRow('Monounsaturated Fat', '1g'),
                  _buildNutritionRow('Cholesterol', '212mg'),
                  _buildNutritionRow('Sodium', '70mg'),
                  _buildNutritionRow('Fiber', '0.00g'),
                  _buildNutritionRow('Sugar', '0.00g'),
                  _buildNutritionRow('Potassium', '67mg'),
                  _buildNutritionRow('Vitamin A', '70µg'),
                  _buildNutritionRow('Vitamin C', '0.00mg'),
                  _buildNutritionRow('Calcium', '28mg'),
                  _buildNutritionRow('Iron', '0.00mg'),
                  
                  const SizedBox(height: 120), 
                ],
              ),
            ),
          ),

          if (_isLogVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.9)],
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('Log', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildMeasurementChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildNutrientSmallCard(String label, String value, String svgPath, Color iconColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  svgPath,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 5),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}