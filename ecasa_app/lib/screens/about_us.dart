import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';


void main() {
  runApp(AboutusApp());
}

class AboutusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutusPage(),
    );
  }
}

class AboutusPage extends StatefulWidget {

  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
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
                left: 123,
                top: 125,
                child: Text(
                  'Tentang Kami',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 263,
                child: SizedBox(
                  width: 85,
                  height: 20,
                  child: Text(
                    'Penyusun',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 660,
                child: SizedBox(
                  width: 200,
                  height: 12,
                  child: Text(
                    '© 2023 all right reserved SaveOurBrain ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 296,
                child: SizedBox(
                  width: 80,
                  height: 120,
                  child: Text(
                    'E32221098\nE32220213\nE32221220\nE32220549\nE32221250\nE32221231',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 163,
                top: 296,
                child: SizedBox(
                  width: 200,
                  height: 120,
                  child: Text(
                    'Jery Nauval Nickolas\nSaddam Andika Putra\nMuhammad Miftahul Huda\nUrip Agila Setio\nPascal Petra Laska\nReyhan Naufal Tsaqif',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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
              Positioned(
                left: 24,
                top: 466,
                child: Container(
                  width: 312,
                  height: 48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("/assets/logos/sobdash_logo.png"),
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
