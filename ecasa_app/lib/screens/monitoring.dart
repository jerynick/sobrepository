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
                left: 15,
                top: 411,
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
                top: 411,
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
                top: 299,
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
                left: 44,
                top: 332,
                child: SizedBox(
                  width: 92,
                  height: 25,
                  child: Text(
                    'Humidity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 43,
                top: 444,
                child: SizedBox(
                  width: 93,
                  height: 25,
                  child: Text(
                    'Fan Speed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 523,
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
                top: 523,
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
                top: 556,
                child: SizedBox(
                  width: 136,
                  height: 25,
                  child: Text(
                    'LED Brigthness',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 195,
                top: 299,
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
                left: 222,
                top: 318,
                child: SizedBox(
                  width: 95,
                  height: 52,
                  child: Text(
                    '60 %',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 222,
                top: 431,
                child: SizedBox(
                  width: 96,
                  height: 52,
                  child: Text(
                    '50 %',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 222,
                top: 543,
                child: SizedBox(
                  width: 103,
                  height: 52,
                  child: Text(
                    '70 %',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 186,
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
                left: 44,
                top: 219,
                child: SizedBox(
                  width: 136,
                  height: 25,
                  child: Text(
                    'Temperature',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 186,
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
              Positioned(
                left: 214,
                top: 206,
                child: SizedBox(
                  width: 110,
                  height: 50,
                  child: Text(
                    '20°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 186,
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
                left: 44,
                top: 219,
                child: SizedBox(
                  width: 136,
                  height: 25,
                  child: Text(
                    'Temperature',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 186,
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
              Positioned(
                left: 214,
                top: 206,
                child: SizedBox(
                  width: 110,
                  height: 50,
                  child: Text(
                    '20°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 112,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 24,
                top: 42,
                child: Container(
                  width: 312,
                  height: 48,
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

