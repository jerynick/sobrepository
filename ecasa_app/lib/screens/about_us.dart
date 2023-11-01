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
                  left: 108,
                  top: 105,
                  child: Text(
                    'Tentang Kami',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Goldman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 348,
                  child: SizedBox(
                    width: 80,
                    height: 20,
                    child: Text(
                      'Penyusun',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 78,
                  top: 754,
                  child: SizedBox(
                    width: 207,
                    height: 20,
                    child: Text(
                      '© 2023 all right reserved SaveOurBrain ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 374,
                  child: SizedBox(
                    width: 70,
                    height: 79,
                    child: Text(
                      'E32221098\nE32220213\nE32221220\nE32220549\nE32221250\nE32221231',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 139,
                  top: 374,
                  child: SizedBox(
                    width: 203,
                    height: 79,
                    child: Text(
                      'Jery Nauval Nickolas\nSaddam Andika Putra\nMuhammad Miftahul Huda\nUrip Agila Setio\nPascal Petra Laska\nReyhan Naufal Tsafiq',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
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