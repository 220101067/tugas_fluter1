import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latian_1/Nafbar/launcher.dart'; // Impor file launcher.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text(
              'Portfolio',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.menu), // Ikon menu di kanan
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Membuka endDrawer
                  },
                );
              }),
            ],
          ),
          endDrawer: CustomDrawer(), // Menggunakan endDrawer
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bagian Foto Profil
                  ClipOval(
                    child: Image.asset(
                      'assets/foto_reza.jpeg',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 25),

                  const SizedBox(height: 20),

                  // Bagian Card dengan Info
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Reza aditya thohir',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Mobile Application Engineer',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'I’m a Flutter and Laravel Developer who enjoys creating apps and backend systems while continuously learning new technologies.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _infoCard(
                                icon: Icons.work,
                                title: 'Experience',
                                value: '3+ Years',
                                color: Colors.blue.shade100,
                              ),
                              _infoCard(
                                icon: Icons.code,
                                title: 'Projects',
                                value: '20+',
                                color: Colors.pink.shade100,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Skills & Expertise',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: const [
                              _skillChip(
                                  'Flutter', 'assets/logo_flutter.png'),
                              _skillChip('Dart', 'assets/logo_dart.png'),
                              _skillChip('laravel',
                                  'assets/logo_laravel.png'),
                              _skillChip('php',
                                  'assets/php_logo.png'),
                              _skillChip('Git', 'assets/logo_git.png'),
                              _skillChip(
                                  'UI/UX', 'assets/logo_figma.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Fungsi Info Card
Widget _infoCard({
  required IconData icon,
  required String title,
  required String value,
  required Color color,
}) {
  return Container(
    width: 140,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.black54, size: 30),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

class _skillChip extends StatelessWidget {
  final String label;
  final String imagePath; // Tambahkan parameter untuk gambar

  const _skillChip(this.label, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ), // Gambar sebagai ikon
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }
}
