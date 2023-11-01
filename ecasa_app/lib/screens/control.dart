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
                  top: 484,
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
                  left: 214,
                  top: 484,
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
                  left: 14,
                  top: 372,
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
                  left: 214,
                  top: 372,
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
                  top: 260,
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
                  left: 214,
                  top: 260,
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
                  left: 44,
                  top: 293,
                  child: SizedBox(
                    width: 135,
                    height: 25,
                    child: Text(
                      'Door Control',
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
                  left: 43,
                  top: 393,
                  child: SizedBox(
                    width: 136,
                    height: 54,
                    child: Text(
                      'Fan Speed Control',
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
                  left: 33,
                  top: 506,
                  child: SizedBox(
                    width: 170,
                    height: 54,
                    child: Text(
                      'LED Brigthness Control',
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
                  left: 220,
                  top: 286,
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
                  left: 250,
                  top: 399,
                  child: SizedBox(
                    width: 58,
                    height: 37,
                    child: Text(
                      'GO',
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
                  left: 250,
                  top: 511,
                  child: SizedBox(
                    width: 58,
                    height: 37,
                    child: Text(
                      'GO',
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


