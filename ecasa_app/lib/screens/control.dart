import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecasa_app/screens/ledcontrol.dart';
import 'package:ecasa_app/screens/lcdcontrol.dart';
import 'package:ecasa_app/screens/autocontroldashboard.dart';


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

  runApp(ControlApp());
}

class ControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatefulWidget {

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int _selectedIndex = 0;
  bool isFanOn = true;
  bool isGateOpen = true;
  bool isCanopiOpen = true;
  
  final DatabaseReference FanReference =
    FirebaseDatabase.instance.reference().child('Fan');
  
  final DatabaseReference GateReference =
    FirebaseDatabase.instance.reference().child('Gate');

  final DatabaseReference CanopiReference =
    FirebaseDatabase.instance.reference().child('Canopi');

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk memuat nilai terakhir dari Firebase saat aplikasi dimulai
    _loadValuesFromFirebase();
  }

  void _loadValuesFromFirebase() async {
    try {
      DatabaseEvent fanEvent = await FanReference.once();
      DataSnapshot fanSnapshot = fanEvent.snapshot;
      if (fanSnapshot.value != null) {
        setState(() {
          isFanOn = fanSnapshot.value == 'ON';
        });
      }
    } catch (error) {
      print("Error loading Fan value from Firebase: $error");
    }

    try {
      DatabaseEvent gateEvent = await GateReference.once();
      DataSnapshot gateSnapshot = gateEvent.snapshot;
      if (gateSnapshot.value != null) {
        setState(() {
          isGateOpen = gateSnapshot.value == 'OPEN';
        });
      }
    } catch (error) {
      print("Error loading Gate value from Firebase: $error");
    }

    try {
      DatabaseEvent canopiEvent = await CanopiReference.once();
      DataSnapshot canopiSnapshot = canopiEvent.snapshot;
      if (canopiSnapshot.value != null) {
        setState(() {
          isCanopiOpen = canopiSnapshot.value == 'UP';
        });
      }
    } catch (error) {
      print("Error loading Canopi value from Firebase: $error");
    }
  }

  void _sendAutoMode() {
    DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
    firebaseRef.child('Automatic').set('AUTO').then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AutoPage()), // Ganti ControlPage dengan nama yang sesuai
      );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    void _toggleFan() {
    setState(() {
      isFanOn = !isFanOn;
    });

    FanReference.set(isFanOn ? 'ON' : 'OFF');
  }

  void _toggleGate() {
    setState(() {
      isGateOpen = !isGateOpen;
    });
    
    GateReference.set(isGateOpen ? 'OPEN' : 'CLOSE');
  }

  void _toggleCanopi() {
    setState(() {
      isCanopiOpen = !isCanopiOpen;
    });
    
    CanopiReference.set(isCanopiOpen ? 'UP' : 'DOWN');
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
                      image: AssetImage("assets/img/control.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 339,
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
                                left: 36,
                                top: 58,
                                child: GestureDetector (
                                  onDoubleTap: _toggleFan,
                                child: SizedBox(
                                  width: 48,
                                  height: 18,
                                  child: Text(
                                    isFanOn ?'ON' : 'OFF',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none,
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
                        left: 31,
                        top: 10,
                        child: SizedBox(
                          width: 58,
                          height: 12,
                          child: Text(
                            'Fan Control',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
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
                left: 207,
                top: 339,
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
                                top: 58,
                                child: GestureDetector (
                                  onDoubleTap: _toggleGate,
                                child: SizedBox(
                                  width: 74,
                                  height: 17,
                                  child: Text(
                                    isGateOpen ?'OPEN' : 'CLOSE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
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
                        left: 31,
                        top: 10,
                        child: SizedBox(
                          width: 58,
                          height: 12,
                          child: Text(
                            'Gate Control',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 502,
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
                                top: 58,
                                child: GestureDetector(
                                  onDoubleTap: _toggleCanopi,
                                child: SizedBox(
                                  width: 74,
                                  height: 17,
                                  child: Text(
                                    isCanopiOpen ?'UP' : 'DOWN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none,
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
                        left: 27,
                        top: 8,
                        child: SizedBox(
                          width: 67,
                          height: 12,
                          child: Text(
                            'Canopi Control',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
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
                left: 33,
                top: 648,
                child: Container(
                  width: 120,
                  height: 49,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 16,
                        child: Container(
                          width: 120,
                          height: 33,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120,
                                  height: 33,
                                  decoration: ShapeDecoration(
                                    color: Color(0x59222742),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ledControlPage()),
                            );
                          },
                        child: SizedBox(
                          width: 28,
                          height: 17,
                          child: Text(
                            'GO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      ),
                      Positioned(
                        left: 27,
                        top: 0,
                        child: SizedBox(
                          width: 67,
                          height: 12,
                          child: Text(
                            'LED Control',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
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
                left: 207,
                top: 648,
                child: Container(
                  width: 120,
                  height: 49,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 16,
                        child: Container(
                          width: 120,
                          height: 33,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120,
                                  height: 33,
                                  decoration: ShapeDecoration(
                                    color: Color(0x59222742),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => LCDControlPage()),
                            );
                          },
                        child: SizedBox(
                          width: 28,
                          height: 17,
                          child: Text(
                            'GO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      ),
                      Positioned(
                        left: 27,
                        top: 0,
                        child: SizedBox(
                          width: 67,
                          height: 12,
                          child: Text(
                            'LCD Custom',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
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
                left: 33,
                top: 248,
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
                        left: 200,
                        top: 0,
                        child: Container(
                          width: 90,
                          height: 65,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0D1F60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 32,
                        top: 21,
                        child: Text(
                          'Autonomos Mode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Positioned(
                        left: 230,
                        top: 21,
                        child: GestureDetector(
                          onTap: _sendAutoMode,
                        child: Text(
                          'GO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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

