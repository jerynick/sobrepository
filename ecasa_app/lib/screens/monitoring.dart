import 'package:flutter/material.dart';
import 'package:ecasa_app/buttom_nav.dart';

class SensorData {
  final String title;
  final String value;

  SensorData(this.title, this.value);
}

class MonitoringPage extends StatelessWidget {
  final SensorData suhuData;
  final SensorData kelembabanData;
  final SensorData pintuStatusData;
  final SensorData kecerahanLampuData;
  final SensorData kecepatanKipasData;

  MonitoringPage({
    required this.suhuData,
    required this.kelembabanData,
    required this.pintuStatusData,
    required this.kecerahanLampuData,
    required this.kecepatanKipasData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logos/sobdash_logo.png'),
                  fit: BoxFit.fill,
                  ),
              ),
            ),
            Container(
              width: 204,
              height: 28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logos/imo_logo.png'),
                  fit: BoxFit.fill,
                  ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 38, top: 224),
              child: SizedBox(
                width: 114,
                height: 72,
                child: Text(
                  '${suhuData.value}°C',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 45,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 38, top: 354),
              child: SizedBox(
                width: 122,
                height: 72,
                child: Text(
                  '${kelembabanData.value}%',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 45,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 38, top: 502),
              child: SizedBox(
                width: 122,
                height: 41,
                child: Text(
                  pintuStatusData.value,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 26,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 44, top: 593),
              child: SizedBox(
                width: 122,
                height: 72,
                child: Text(
                  '${kecerahanLampuData.value}%',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 45,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 205, top: 625),
              child: SizedBox(
                width: 122,
                height: 49,
                child: Text(
                  '${kecepatanKipasData.value}%',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 35,
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
      backgroundColor: Colors.white,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MonitoringPage(
        suhuData: SensorData('Suhu', '28'),
        kelembabanData: SensorData('Kelembaban', '60'),
        pintuStatusData: SensorData('Pintu Terbuka', 'OPEN'),
        kecerahanLampuData: SensorData('Kecerahan Lampu', '80'),
        kecepatanKipasData: SensorData('Kecepatan Kipas', '50'),
      ),
    ),
  );
}
