import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latian_1/lit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latian_1/main.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Reza Aditya",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: const Text("rezaaditya@gmail.com",
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/logo.png", // Ganti dengan path gambar Anda
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'))),
          ),
          ListTile(
            leading: ClipOval( // Membungkus gambar dengan ClipOval untuk bentuk lingkaran
              child: Image.asset(
                'assets/home.png', // Ganti dengan path gambar Anda
                width: 24,
                height: 24,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
            ),
            title: Text('Home'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: ClipOval( // Membungkus gambar dengan ClipOval untuk bentuk lingkaran
              child: Image.asset(
                'assets/buku.png', // Ganti dengan path gambar Anda
                width: 24,
                height: 24,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
            ),
            title: Text('Read Books'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/litpage') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LitPage(),
                    settings: RouteSettings(name: '/litpage'),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: ClipOval( // Membungkus gambar dengan ClipOval untuk bentuk lingkaran
              child: Image.asset(
                'assets/wa.jpg', // Ganti dengan path gambar Anda
                width: 24,
                height: 24,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
            ),
            title: Text('WhatsApp'),
            onTap: () async {
              final Uri url = Uri.parse('https://wa.me/6281365137330?text=Hello');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
           ListTile(
            leading: ClipOval( // Membungkus gambar dengan ClipOval untuk bentuk lingkaran
              child: Image.asset(
                'assets/ig.jpeg', // Ganti dengan path gambar Anda
                width: 24,
                height: 24,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
            ),
            title: Text('instagram'),
            onTap: () async {
              final Uri url = Uri.parse('https://instagram.com/direct/new/?text=Hello');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Keluar',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
