import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecasa_app/screens/control.dart';
import 'package:ecasa_app/screens/lcdcustom.dart';
import 'package:ecasa_app/buttom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA-yCEGtZUSeR3oWeZvT19MoXKNHJIE9wc", 
      appId: "1:711821385500:android:03bab75d8c36fc3b7ca4d9", 
      messagingSenderId: "711821385500", 
      projectId: "ecasa-db",
      storageBucket: "ecasa-db.appspot.com",
      databaseURL: "https://ecasa-db-default-rtdb.firebaseio.com"
    ),
  );

  runApp(LCDControlApp());
}

class LCDControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LCDControlPage(),
    );
  }
}

class LCDControlPage extends StatefulWidget {

  @override
  _LCDControlPageState createState() => _LCDControlPageState();
}

class _LCDControlPageState extends State<LCDControlPage> {
  int _selectedIndex = 0;
  bool isTempShow = true;
  bool isAirQShow = true;
  bool isRainShow = true;

  final DatabaseReference tempReference =
    FirebaseDatabase.instance.reference().child('/LCD/DHT11');
  
  final DatabaseReference airQReference =
    FirebaseDatabase.instance.reference().child('/LCD/mq135');

  final DatabaseReference rainReference =
    FirebaseDatabase.instance.reference().child('/LCD/Rain');

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk memuat nilai terakhir dari Firebase saat aplikasi dimulai
    _loadValuesFromFirebase();
  }

void _loadValuesFromFirebase() async {
  try {
    DatabaseEvent tempEvent = await tempReference.once();
    DataSnapshot tempSnapshot = tempEvent.snapshot;
    if (tempSnapshot.value != null) {
      setState(() {
        isTempShow = tempSnapshot.value == 'YES';
      });
    }
  } catch (error) {
    print("Error loading Temp Display value from Firebase: $error");
  }

  try {
    DatabaseEvent airQEvent = await airQReference.once();
    DataSnapshot airQSnapshot = airQEvent.snapshot;
    if (airQSnapshot.value != null) {
      setState(() {
        isAirQShow = airQSnapshot.value == 'YES';
      });
    }
  } catch (error) {
    print("Error loading AirQ display value from Firebase: $error");
  }

  try {
    DatabaseEvent RainEvent = await rainReference.once();
    DataSnapshot RainSnapshot = RainEvent.snapshot;
    if (RainSnapshot.value != null) {
      setState(() {
        isRainShow = RainSnapshot.value == 'YES';
      });
    }
  } catch (error) {
    print("Error loading Rain Status display value from Firebase: $error");
  }
}

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleTemp() {
    setState(() {
      isTempShow = !isTempShow;
    });

    tempReference.set(isTempShow ? 'YES' : 'NO');
  }

  void _toggleAirQ() {
    setState(() {
      isAirQShow = !isAirQShow;
    });

    airQReference.set(isAirQShow ? 'YES' : 'NO');
  }

  void _toggleRain() {
    setState(() {
      isRainShow = !isRainShow;
    });

    rainReference.set(isRainShow ? 'YES' : 'NO');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Container(
          width: 360,
          height: 795,
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
                      image: AssetImage("assets/img/control.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 380,
                child: Container(
                  width: 260,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 260,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 154,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFF069),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 225,
                        top: 0,
                        child: Container(
                          width: 35,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFF596EBC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8,
                        child: Text(
                          'Temperature sensor display',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 230,
                        top: 8,
                        child: GestureDetector(
                          onDoubleTap: _toggleTemp,
                        child: Text(
                          isTempShow ? 'YES' : 'NO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 420,
                child: Container(
                  width: 260,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 260,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 154,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFF79FF6D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 8,
                        child: Text(
                          'Air Quality sensor display',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Positioned(
                        left: 225,
                        top: 0,
                        child: Container(
                          width: 35,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFF596EBC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 230,
                        top: 8,
                        child: GestureDetector(
                          onDoubleTap: _toggleAirQ,
                        child: Text(
                          isAirQShow ? 'YES' : 'NO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 460,
                child: Container(
                  width: 260,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 260,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 154,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6DFFD3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 7,
                        child: Text(
                          'Rain sensor display',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 225,
                        top: 0,
                        child: Container(
                          width: 35,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFF596EBC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 230,
                        top: 8,
                        child: GestureDetector(
                          onDoubleTap: _toggleRain,
                        child: Text(
                          isRainShow ? 'YES' : 'NO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 500,
                child: Text(
                  'Caution : LCD can only display one sensor data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF0404),
                    fontSize: 13,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
              Positioned(
                left: 90,
                top: 701,
                child: Text(
                  'Want to customize LCD text?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                left: 240,
                top: 701,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LcdCustom())
                    );
                  },
                child: Text(
                  'here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1410FF),
                    fontSize: 13,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
              ),
              Positioned(
                left: 89,
                top: 665,
                child: Container(
                  width: 182,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 182,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFF600D0D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 10,
                        child: GestureDetector (
                          onTap: () {
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => ControlPage()),
                            );
                          },
                        child: SizedBox(
                          width: 111,
                          height: 16,
                          child: Text(
                            'EXIT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 611,
                child: Container(
                  width: 126,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 126,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0D1F60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => ControlPage()),
                            );                            
                          },
                        child: SizedBox(
                          width: 44,
                          height: 16,
                          child: Text(
                            'SAVE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none
                            ),
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
    ),

    );
  }
}