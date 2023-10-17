import 'package:flutter/material.dart';
import 'monitoring.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logos/sobstart_logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 504,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to Dashboard when button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MonitoringPage(
                         suhuData: SensorData('Suhu', '28'),
                         kelembabanData: SensorData('Kelembaban', '60'),
                         pintuStatusData: SensorData('Pintu Terbuka', 'OPEN'),
                         kecerahanLampuData: SensorData('Kecerahan Lampu', '80'),
                         kecepatanKipasData: SensorData('Kecepatan Kipas', '50'),
                      )),
                    );
                  },
                  child: Container(
                    width: 213,
                    height: 71,
                    decoration: BoxDecoration(
                      color: Color(0xFF2B2E4A), // Set the button color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'MULAI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 78,
                top: 575,
                child: Container(
                width: 204,
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
    );
  }
}
