import 'package:ecasa_app/screens/monitoring.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
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
                  left: 10,
                  top: 164,
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke Dashboard ketika gambar/tulisan ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MonitoringPage()),
                      );
                    },
                    child: Container(
                      width: 340,
                      height: 340,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // Gunakan AssetImage untuk gambar lokal
                          image: AssetImage("assets/logos/sobstart_logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 73,
                  top: 504,
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke Dashboard ketika tulisan ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MonitoringPage()),
                      );
                    },
                    child: Container(
                      width: 213,
                      height: 71,
                      decoration: ShapeDecoration(
                        color: Color(0xFF2B2E4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'MULAI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 78,
                  top: 575,
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke Dashboard ketika gambar/tulisan ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MonitoringPage()),
                      );
                    },
                    child: Container(
                      width: 204,
                      height: 48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // Gunakan AssetImage untuk gambar lokal
                          image: AssetImage("assets/images/your_image.png"),
                          fit: BoxFit.fill,
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
    );
  }
}
