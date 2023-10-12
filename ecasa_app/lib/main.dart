import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';  // Gantilah dengan path sesuai struktur proyek kamu
import 'screens/start_page.dart';    // Gantilah dengan path sesuai struktur proyek kamu

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',  // Gantilah sesuai route awal yang ingin ditampilkan
      routes: {
        '/': (context) => SplashScreen(),
        '/start': (context) => StartPage(),
        // Tambahkan route lain sesuai kebutuhan
      },
    );
  }
}
