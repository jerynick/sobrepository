import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


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

class MonitoringPage extends StatefulWidget {

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  int _selectedIndex = 0;

  double temp = 0.0;
  double hum = 0.0;
  double air = 0.0;
  String gate = '';

@override
void initState() {
  super.initState();
  DatabaseReference _firebaseRef = FirebaseDatabase.instance.reference();

  _firebaseRef.onValue.listen((event) {
    if (event.snapshot.value != null) {
      final dynamic data = event.snapshot.value;
      setState(() {
        temp = (data['Suhu'] as double?) ?? 0.0;
        hum = (data['Kelembaban'] as double?) ?? 0.0;
        air = (data['Udara'] as double?) ?? 0.0;
        gate = (data['Gate'] as String?) ?? '';

      });
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
    body : Column(
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
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 333,
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
                                    '$temp °C',
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
                top: 333,
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
                                    '$hum %',
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
                top: 496,
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
                        top: 5,
                        child: SizedBox(
                          width: 68,
                          height: 9,
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
                top: 496,
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
                                left: 39,
                                top: 54,
                                child: Container(
                                  width: 43,
                                  height: 27,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: SizedBox(
                                          width: 45,
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
                                        left: 8,
                                        top: 17,
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
}

