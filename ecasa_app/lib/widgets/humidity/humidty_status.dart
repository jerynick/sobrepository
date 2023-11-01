import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:ecasa_app/screens/monitoring.dart';

void main() {
  runApp(HumApp());
}

class HumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HumPage(),
    );
  }
}

class HumPage extends StatefulWidget {

  @override
  _HumPageState createState() => _HumPageState();
}

class _HumPageState extends State<HumPage> {
  int _selectedIndex = 0;

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
                  left: 14,
                  top: 231,
                  child: Container(
                    width: 329,
                    height: 279,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2B2E4A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 231,
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      width: 329,
                      height: 279,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 81,
                  top: 308,
                  child: SizedBox(
                    width: 197,
                    height: 127,
                    child: Text(
                      'Display                     graphic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 120,
                  child: Container(
                    width: 329,
                    height: 91,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2B2E4A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 194,
                  top: 120,
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      width: 149,
                      height: 91,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 153,
                  child: SizedBox(
                    width: 92,
                    height: 25,
                    child: Text(
                      'Humidity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 209,
                  top: 139,
                  child: SizedBox(
                    width: 119,
                    height: 52,
                    child: Text(
                      '60 %',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 95,
                  top: 530,
                  child: Container(
                    width: 170,
                    height: 64,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2B2E4A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 112,
                  top: 540,
                  child: GestureDetector(
                      onTap: () {
                      // Navigate to TempPage when the text is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MonitoringPage()),
                        );
                      },
                    child: SizedBox(
                      width: 136,
                      height: 44,
                      child: Text(
                        'EXIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'RubikMonoOne',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: -9,
                  child: Container(
                    width: 360,
                    height: 94,
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                  ),
                ),
                    Positioned(
                      left: 23,
                      top: 14,
                      child: Container(
                        width: 312,
                        height: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logos/sobdash_logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 78,
                      top: 45,
                      child: Container(
                        width: 204,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logos/imo_logo.png"),
                            fit: BoxFit.fill,
                          ),
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