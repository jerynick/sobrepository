import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecasa_app/screens/ledcontrol.dart';


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
  bool isLed1On = true;
  bool isLed2On = true;
  bool isLed3On = true;
  
  final DatabaseReference FanReference =
    FirebaseDatabase.instance.reference().child('Fan');
  
  final DatabaseReference GateReference =
    FirebaseDatabase.instance.reference().child('Gate');

  final DatabaseReference led1Reference =
    FirebaseDatabase.instance.reference().child('Led_1');

  final DatabaseReference led2Reference =
    FirebaseDatabase.instance.reference().child('Led_2');

  final DatabaseReference led3Reference =
    FirebaseDatabase.instance.reference().child('Led_3');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    void _toggleFan() {
    setState(() {
      isFanOn = !isFanOn;
    });

    FanReference.set(isFanOn ? 'OPEN' : 'CLOSE');
  }

    void _toggleGate() {
    setState(() {
      isGateOpen = !isGateOpen;
    });
    
    GateReference.set(isGateOpen ? 'OPEN' : 'CLOSE');
  }

  void _toggleLed1() {
    setState(() {
      isLed1On = !isLed1On;
    });

    led1Reference.set(isLed1On ? 'ON' : 'OFF');
  }

  void _toggleLed2() {
    setState(() {
      isLed2On = !isLed2On;
    });

    led2Reference.set(isLed1On ? 'ON' : 'OFF');
  }

  void _toggleLed3() {
    setState(() {
      isLed3On = !isLed3On;
    });

    led3Reference.set(isLed3On ? 'ON' : 'OFF');
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
                      image: AssetImage("assets/img/control.png"),
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
                                left: 23,
                                top: 60,
                                child: GestureDetector(
                                  onDoubleTap: _toggleFan,
                                  child: SizedBox(
                                    width: 74,
                                    height: 15,
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
                left: 209,
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
                                left: 23,
                                top: 60,
                                child: SizedBox(
                                  width: 74,
                                  height: 15,
                                  child: GestureDetector(
                                    onDoubleTap: _toggleGate,
                                    child: Text(
                                      isGateOpen ? 'OPEN' : 'CLOSE',
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
                            'Gate Control',
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
                left: 120,
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
                                child : GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ledControlPage()),                                  
                                    );
                                  },
                                  child: SizedBox(
                                    width: 74,
                                    height: 15,
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 8,
                        child: SizedBox(
                          width: 58,
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



