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
      apiKey: "AIzaSyBZu1jO2h35SpHk_3VsrYIqmcSqL65Dq_w", 
      appId: "1:205885020375:android:5649b6f5ef6861f19a3892", 
      messagingSenderId: "205885020375", 
      projectId: "displaydht11",
      storageBucket: "displaydht11.appspot.com",
      databaseURL: "https://displaydht11-default-rtdb.firebaseio.com/"
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