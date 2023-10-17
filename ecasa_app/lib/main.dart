import 'package:ecasa_app/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:ecasa_app/screens/splash_screen.dart';
//import 'dashboard_page.dart';
//import 'menu_page.dart';
//import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      // Rute-rute aplikasi didefinisikan di sini
      routes: {
        '/': (context) => SplashScreen(), // Rute halaman utama
        '/start': (context) => StartPage(), // Rute mulai
        //'/menu': (context) => MenuPage(), // Rute menu
       // '/settings': (context) => SettingsPage(), // Rute settings
      },
      initialRoute: '/', // Rute awal saat aplikasi dimulai
    );
  }
}