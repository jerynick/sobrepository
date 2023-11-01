import 'package:flutter/material.dart';
import 'package:ecasa_app/screens/splash_screen.dart';
import 'package:ecasa_app/screens/monitoring.dart';
import 'package:ecasa_app/screens/control.dart';
import 'package:ecasa_app/screens/about_us.dart';
import 'package:ecasa_app/widgets/temperature/temperature_display.dart';
import 'package:ecasa_app/widgets/humidity/humidty_status.dart';
import 'package:ecasa_app/widgets/door_status/door_status_display.dart';

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
        '/': (context) => SplashScreen(), 
        '/monitoring': (context) => MonitoringPage(), 
        '/control': (context) => ControlPage(),
        '/aboutus': (context) => AboutusPage(),  
        '/temperature' : (context) => TempPage(),
        '/humidity' : (context) => HumPage(),
        '/doorstat' : (context) => DoorStatPage(),
      },
      initialRoute: '/', // Rute awal saat aplikasi dimulai
    );
  }
}