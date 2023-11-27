import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/ic_monitor.png',
            width: 30,
            height: 30,
            fit: BoxFit.contain
          ),
          label: 'Monitoring',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/ic_control.png',
            width: 30,
            height: 30,
            fit: BoxFit.contain
          ),
          label: 'Control',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/ic_pp.png',
            width: 30,
            height: 30,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color.fromARGB(255, 135, 135, 135),
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
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }
}