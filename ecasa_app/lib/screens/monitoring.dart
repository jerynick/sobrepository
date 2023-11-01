import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
//import 'package:ecasa_app/widgets/fan_control/fan_speed_control.dart';
//import 'package:ecasa_app/widgets/brightness_control/brigthness_control.dart';

void main() {
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
                  left: 15,
                  top: 150,
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
                  left: 15,
                  top: 486,
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
                  left: 195,
                  top: 486,
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
                  left: 15,
                  top: 262,
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
                  left: 195,
                  top: 262,
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
                  left: 44,
                  top: 183,
                    child: SizedBox(
                      width: 136,
                      height: 25,
                      child: Text(
                        'Temperature',
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
                  left: 201,
                  top: 170,
                  child: SizedBox(
                    width: 138,
                    height: 50,
                    child: Text(
                      '20°C',
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
                  left: 44,
                  top: 295,
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
                  left: 210,
                  top: 281,
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
                  left: 43,
                  top: 519,
                  child: SizedBox(
                    width: 136,
                    height: 25,
                    child: Text(
                      'Fan Speed',
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
                  left: 210,
                  top: 506,
                  child: SizedBox(
                    width: 119,
                    height: 52,
                    child: Text(
                      '50 %',
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
                  left: 15,
                  top: 598,
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
                  left: 195,
                  top: 598,
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
                  top: 619,
                  child: SizedBox(
                    width: 136,
                    height: 51,
                    child: Text(
                      'LED Brightness',
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
                  left: 210,
                  top: 618,
                  child: SizedBox(
                    width: 119,
                    height: 52,
                    child: Text(
                      '70 %',
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
                  left: 14,
                  top: 374,
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
                  left: 195,
                  top: 374,
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
                  top: 407,
                  child: SizedBox(
                    width: 136,
                    height: 25,
                    child: SizedBox(
                      width: 92,
                      height: 25,
                    child: Text(
                      'Door Status',
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
                  ),
                Positioned(
                  left: 211,
                  top: 401,
                  child: SizedBox(
                    width: 117,
                    height: 38,
                    child: Text(
                      'OPEN\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
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
                Positioned(
                  left: 194,
                  top: 150,
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      width: 150,
                      height: 92,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
