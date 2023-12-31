import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

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

  runApp(MonitoringApp());
}
class MonitoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MonitoringPage(),
    );
  }
}

enum WeatherStatus {
    hujan,
    mendung,
    cerah,
    unknown,
}

class MonitoringPage extends StatefulWidget {

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  int _selectedIndex = 0;

  double temp = 29.4;
  double hum = 0.0;
  double air = 390.1;
  String gate = 'CLOSE';
  String weather = "Rainy";

@override
void initState() {
  super.initState();
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();

    firebaseRef.onValue.listen((event) {
      try {
        if (event.snapshot.value != null) {
          final dynamic data = event.snapshot.value;
          setState(() {
            temp = (data['Suhu'] as double?) ?? 0.0;
            hum = (data['Kelembaban'] as double?) ?? 0.0;
            air = (data['Udara'] as double?) ?? 0.0;
            gate = (data['GateStatus'] as String?) ?? '';
            weather = (data['RainStatus'] as String?) ?? '';
          });
        }
      } catch (e) {
        print('Error: $e');
      }
    });
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 35,
                child: Container(
                  width: 360,
                  height: 165.67,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/monitor.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 369,
                child: Container(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: ShapeDecoration(
                                    color: Color(0x59222742),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 3.83,
                                top: 3.83,
                                child: Container(
                                  width: 112.04,
                                  height: 112.04,
                                  decoration: ShapeDecoration(
                                    color: Colors.white.withOpacity(0.699999988079071),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18.57,
                                top: 24.47,
                                child: Container(
                                  width: 82.56,
                                  height: 82.56,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: OvalBorder(),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 28,
                                top: 59,
                                child: SizedBox(
                                  width: 64,
                                  height: 14.40,
                                  child: Text(
                                    '$temp°C',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 9,
                        child: SizedBox(
                          width: 68,
                          height: 10,
                          child: Text(
                            'Temperature',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 369,
                child: Container(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: ShapeDecoration(
                                    color: Color(0x59222742),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 3.83,
                                top: 3.83,
                                child: Container(
                                  width: 112.04,
                                  height: 112.04,
                                  decoration: ShapeDecoration(
                                    color: Colors.white.withOpacity(0.699999988079071),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18.57,
                                top: 24.47,
                                child: Container(
                                  width: 82.56,
                                  height: 82.56,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: OvalBorder(),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 28,
                                top: 59,
                                child: SizedBox(
                                  width: 65,
                                  height: 14.40,
                                  child: Text(
                                    '$hum%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 7,
                        child: SizedBox(
                          width: 68,
                          height: 13,
                          child: Text(
                            'Humidity',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 532,
                child: Container(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: ShapeDecoration(
                                    color: Color(0x59222742),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 3.83,
                                top: 3.83,
                                child: Container(
                                  width: 112.04,
                                  height: 112.04,
                                  decoration: ShapeDecoration(
                                    color: Colors.white.withOpacity(0.699999988079071),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18.57,
                                top: 24.47,
                                child: Container(
                                  width: 82.56,
                                  height: 82.56,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: OvalBorder(),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 23,
                                top: 60,
                                child: SizedBox(
                                  width: 74,
                                  height: 15,
                                  child: Text(
                                    '$gate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 13,
                        child: SizedBox(
                          width: 68,
                          height: 13,
                          child: Text(
                            'Gate Status',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 532,
                child: Container(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: ShapeDecoration(
                            color: Color(0x59222742),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 3.83,
                        top: 3.83,
                        child: Container(
                          width: 112.04,
                          height: 112.04,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.699999988079071),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18.57,
                        top: 24.47,
                        child: Container(
                          width: 82.56,
                          height: 82.56,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 54,
                        child: SizedBox(
                          width: 48,
                          height: 14,
                          child: Text(
                            '$air',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 70,
                        child: SizedBox(
                          width: 20,
                          height: 15,
                          child: Text(
                            'ppm',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 8,
                        child: SizedBox(
                          width: 68,
                          height: 12,
                          child: Text(
                            'Air Quality',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 286,
                child: Container(
                  width: 290,
                  height: 65,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 290,
                          height: 65,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 127,
                        top: 26,
                        child: SizedBox(
                          width: 124,
                          height: 17,
                          child: Text(
                            '$weather',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 4,
                        child: Container(
                          width: 94,
                          height: 57,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFFBFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 11,
                        child: Container(
                          width: 53,
                          height: 43,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        child: _getWeatherIcon(weather),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: CustomBottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    )
    );
  }

  Widget _getWeatherIcon(String weatherStatus) {
    switch (weatherStatus.toLowerCase()) {
    case 'sunny':
      return Icon(Icons.wb_sunny, color: Colors.yellow, size: 40); // Sunny weather icon
    case 'rainy':
      return Icon(Icons.beach_access, color: Colors.blue, size: 40); // Rainy weather icon
    case 'cloudy':
      return Icon(Icons.cloud, color: Colors.grey, size: 40); // Cloudy weather icon
    default:
      return Icon(Icons.error, color: Colors.red, size: 40); // Default or error icon
  }
}
}