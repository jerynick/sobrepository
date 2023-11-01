import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'Monitoring',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Control',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About Us',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFFD9D9D9),
      backgroundColor: Color(0xFF2B2E4A),
      onTap: (index) {
        switch (index) {
          case 0:
          // Navigasi ke halaman 'DashboardPage'
            Navigator.pushReplacementNamed(context, '/monitoring');
            break;
          case 1:
          // Navigasi ke halaman 'MenuPage'
            Navigator.pushReplacementNamed(context, '/control');
            break;
          case 2:
          // Navigasi ke halaman 'SettingsPage'
            Navigator.pushReplacementNamed(context, '/aboutus');
            break;
        }
      },
    );
  }
}