import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecasa_app/screens/control.dart';

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

  runApp(AutoApp());
}

class AutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoPage(),
    );
  }
}

class AutoPage extends StatefulWidget {

  @override
  _AutoPageState createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  int _selectedIndex = 0;

  String fanC = 'A/n';
  String gateC = 'A/n'; 
  String canopiC = 'A/n';

@override
void initState() {
  super.initState();
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();

    firebaseRef.onValue.listen((event) {
      try {
        if (event.snapshot.value != null) {
          final dynamic data = event.snapshot.value;
          setState(() {
            fanC = (data['Fan'] as String?) ?? '';
            gateC = (data['Gate'] as String?) ?? '';
            canopiC = (data['Canopi'] as String?) ?? '';
          });
        }
      } catch (e) {
        print('Error: $e');
      }
    });
  }

  void _sendManualMode() {
    DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
    firebaseRef.child('Automatic').set('MANUAL').then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ControlPage()), // Ganti ControlPage dengan nama yang sesuai
      );
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
                      image: AssetImage("assets/img/automode.png"),
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
                                child: SizedBox(
                                  width: 48,
                                  height: 18,
                                  child: Text(
                                    "$fanC",
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
                                child: SizedBox(
                                  width: 74,
                                  height: 17,
                                  child: Text(
                                    "$gateC",
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
                                child: SizedBox(
                                  width: 74,
                                  height: 17,
                                  child: Text(
                                    "$canopiC",
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
                          'Manual Mode',
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
                          onTap: _sendManualMode,
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

