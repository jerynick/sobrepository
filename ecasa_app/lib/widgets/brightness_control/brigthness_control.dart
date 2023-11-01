import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';
import 'package:ecasa_app/screens/control.dart';

void main() {
  runApp(BrightCtrlApp());
}

class BrightCtrlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrightCtrlPage(),
    );
  }
}

class BrightCtrlPage extends StatefulWidget {

  @override
  _BrightCtrlPageState createState() => _BrightCtrlPageState();
}

class _BrightCtrlPageState extends State<BrightCtrlPage> {
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
                top: 289,
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
                top: 289,
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
                top: 297,
                child: SizedBox(
                  width: 135,
                  height: 74,
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
                left: 112,
                top: 423,
                child: SizedBox(
                  width: 135,
                  height: 25,
                  child: Text(
                    'This is slider',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 20,
                      fontFamily: 'Goldman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 298,
                top: 315,
                child: SizedBox(
                  width: 36,
                  height: 38,
                  child: Text(
                    '% ',
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
                left: 95,
                top: 578,
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
                left: 111,
                top: 588,
                  child: GestureDetector(
                      onTap: () {
                      // Navigate to ControlPage when the text is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ControlPage()),
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
