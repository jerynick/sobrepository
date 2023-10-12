import 'package:flutter/material.dart';
import 'control.dart';
import 'monitoring.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Bagian atas dengan logo aplikasi dan logo kamu
          Container(
            width: 360,
            height: 200, // Sesuaikan tinggi sesuai desain Figma
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey), // Atur sesuai desain Figma
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 24,
                  top: 16,
                  child: Container(
                    width: 312,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logos/sobdash_logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 116,
                  child: Container(
                    width: 312,
                    height: 68,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logos/your_logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 360,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey), // Atur sesuai desain Figma
              ),
              child: Stack(
                children: [
                  // Bagian tengah dengan elemen khusus about us
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 360,
                      height: 101,
                      decoration: ShapeDecoration(
                        color: Color(0xFF2B354A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 54,
                    top: 12,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MonitoringPage()),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/monitoring_icon.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 44,
                    top: 52,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ControlPage()),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/control_icon.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 52,
                    child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          // Tambahkan elemen sesuai desain Figma
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 256,
                    top: 52,
                    child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/about_us_icon.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -1379,
                    top: -718,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/about_us_placeholder.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 0,
                    child: Container(
                      width: 312,
                      height: 156.05,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/about_us_header.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 218,
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'IMO atau IOT Monitoring adalah sebuah aplikasi yang berfungsi untuk memonitoring prototipe SmartHome IOT. Dapat dikatakan IMO adalah bentuk rebranding dari SmartHome WEBIOT yang berbentuk website. \nIMO dibuat untuk memudahkan pengguna mengakses SmartHome IOT melalui ponsel pintar. Selain itu, terdapat fitur tambahan yang sangat baik dibandingkan dengan versi WEBIOT. Yaitu adalah kontrol langsung dari aplikasi. Jadi pengguna tidak perlu melakukan konfigurasi pada aplikasi seperti Blynk IOT. Namun, pada versi ini belum terdapat fitur keamanan memadai',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 9,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 337,
                    child: SizedBox(
                      width: 300,
                      height: 73,
                      child: Text(
                        'Prototipe SmartHome IOT merupakan perangkat IOT yang memonitoring dan mengontrol beberapa perangkat elektronik di dalam rumah. Terdiri dari DHT11 sebagai sensor suhu, Magnetic Sensor sebagai sensor pendeteksi pintu terbuka, kipas, dan LED. Implementasinya sendiri kami gunakan di kamar kost. Prototipe ini pernah menjadi juara 2 Expo dan Pekan Ilmiah Jurusan Teknologi Informasi Politeknik Negeri Jember tahun 2023 (EPIM JTI 2023). ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 9,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 443,
                    child: SizedBox(
                      width: 111,
                      height: 121,
                      child: Text(
                        'Jery Nauval Nickolas\n\nSaddam Andika Putra\n\nUrip Agila Setio\n\nMuhammad Miftahul Huda\n\nPascal Petra Laska\n\nReyhan Naufal Tsaqif\n',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 9,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 37,
                    top: 583,
                    child: SizedBox(
                      width: 111,
                      height: 34,
                      child: Text(
                        'Fathur Rachman Hakim\n\nRyan Afriyandi',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 9,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 52,
                    top: 661,
                    child: SizedBox(
                      width: 256,
                      height: 34,
                      child: Text(
                        'POLITEKNIK NEGERI JEMBER\nJURUSAN TEKNOLOGI INFORMASI\nPROGRAM STUDI TEKNIK KOMPUTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 9,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 114,
                    top: 156,
                    child: SizedBox(
                      width: 131,
                      height: 19,
                      child: Text(
                        'TENTANG KAMI',
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 15,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 318,
                    child: SizedBox(
                      width: 144,
                      height: 19,
                      child: Text(
                        'Prototipe SmartHome IOT',
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 10,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 420,
                    child: SizedBox(
                      width: 102,
                      height: 19,
                      child: Text(
                        'Para Pengembang',
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 10,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 564,
                    child: SizedBox(
                      width: 102,
                      height: 19,
                      child: Text(
                        'Para Pendukung',
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 10,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 122,
                    top: 642,
                    child: SizedBox(
                      width: 115,
                      height: 19,
                      child: Text(
                        'Sekian',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2B354A),
                          fontSize: 10,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w900,
                          height: 0,
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
    );
  }
}
