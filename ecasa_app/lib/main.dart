import 'package:flutter/material.dart';
import 'package:ecasa_app/screens/splash_screen.dart';
import 'package:ecasa_app/screens/monitoring.dart';
import 'package:ecasa_app/screens/control.dart';
import 'package:ecasa_app/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyA-yCEGtZUSeR3oWeZvT19MoXKNHJIE9wc',
      appId: '1:711821385500:android:03bab75d8c36fc3b7ca4d9',
      messagingSenderId: '711821385500',
      projectId: 'ecasa-db',
      databaseURL: 'https://ecasa-db-default-rtdb.firebaseio.com',
      storageBucket: 'ecasa-db.appspot.com',
    ),
  );

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
        '/profile': (context) => ProfilePage(),  
      },
      initialRoute: '/', // Rute awal saat aplikasi dimulai
    );
  }
}