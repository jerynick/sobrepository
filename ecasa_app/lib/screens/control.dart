import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';

void main() {
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
  bool isLedOn = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    void _toggleFan() {
    setState(() {
      isFanOn = !isFanOn;
    });
  }

  void _toggleLed() {
    setState(() {
      isLedOn = !isLedOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
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
                left: 16,
                top: 410,
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
                left: 215,
                top: 410,
                child: Opacity(
                  opacity: 0.50,
                  child: Container(
                    width: 130,
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
                top: 298,
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
                left: 215,
                top: 298,
                child: Opacity(
                  opacity: 0.50,
                  child: Container(
                    width: 130,
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
                left: 45,
                top: 320,
                child: SizedBox(
                  width: 153,
                  height: 45,
                  child: Text(
                    'Fan Speed Control',
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
                left: 45,
                top: 433,
                child: SizedBox(
                  width: 170,
                  height: 46,
                  child: Text(
                    'LED Brigthness Control',
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
                left: 246,
                top: 325,
                child: GestureDetector(
                  onTap: _toggleFan,
                  child: SizedBox(
                    width: 80,
                    height: 37,
                    child: Text(
                      isFanOn ? 'ON' : 'OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 246,
                top: 437,
                child: GestureDetector(
                  onTap: _toggleLed,
                  child: SizedBox(
                    width: 80,
                    height: 37,
                    child: Text(
                      isLedOn ? 'ON' : 'OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
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



