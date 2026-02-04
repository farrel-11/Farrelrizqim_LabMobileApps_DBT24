import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const STEMPrasmulPage(),
    );
  }
}

class STEMPrasmulPage extends StatelessWidget {
  const STEMPrasmulPage({super.key});

    void _showFullMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF333333),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          // GUNAKAN ListView agar jika menu terlalu banyak, dia bisa di-scroll dan tidak error
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              _buildMenuItem(context, "PROGRAMS"),
              _buildMenuItem(context, "ADMISSION"),
              _buildMenuItem(context, "PEOPLE"),
              _buildMenuItem(context, "LABORATORY"),
              _buildMenuItem(context, "CAMPUS LIFE"),
              _buildMenuItem(context, "OFFICE & SERVICES"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        _showAlert(context, title);
      },
    );
  }

  void _showAlert(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Informasi", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text("$title clicked"), 
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        title: Image.asset(
          'assets/Prasmul_logo_01-Putih.png',
          height: 35,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _showFullMenu(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/Logo-Universitas-Prasetiya-Mulya.png',
                width: 450,
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("VISION", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("A globally recognized School for STEMpreneur Education and Research", 
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
                  SizedBox(height: 30),
                  Text("MISSION", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Provide quality STEM education and research for nurturing the holistic citizen graduates through:", 
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
                  SizedBox(height: 15),
                  Text("1. Collaborative learning by enterprising involving interdisciplinary catalytic projects", style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 5),
                  Text("2. Innovative and impactful research to the society", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/Logo-Universitas-Prasetiya-Mulya.png',
                    height: 50, 
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  const Text("BSD City Kavling Edutown I.1", style: TextStyle(color: Colors.white)),
                  const Text("Jl. BSD Raya Utama, BSD City 15339", style: TextStyle(color: Colors.white)),
                  const Text("Kabupaten Tangerang, Indonesia", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  const Text("Tel. (021) 304-50-500", style: TextStyle(color: Colors.white)),
                  const Text("Hp. (+62) 81511662005", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  const Text("info@prasetiyamulya.ac.id", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}