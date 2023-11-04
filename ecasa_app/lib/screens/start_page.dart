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
                left: 0,
                top: 35,
                child: Container(
                  width: 360,
                  height: 337.33,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/login.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
                            Positioned(
                left: 27,
                top: 517,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("assets/icon/ic_pp.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 576,
                child: Container(
                  width: 27,
                  height: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("assets/icon/ic_key.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 514,
                child: Container(
                  width: 311,
                  height: 87,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 311,
                          height: 36,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 38,
                                top: 0,
                                child: Container(
                                  width: 273,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 49,
                                top: 10,
                                child: SizedBox(
                                  width: 167,
                                  child: Text(
                                    'Your Email',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 3,
                        top: 3,
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Stack(children: [
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 51,
                        child: Container(
                          width: 311,
                          height: 36,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 38,
                                top: 0,
                                child: Container(
                                  width: 273,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 49,
                                top: 10,
                                child: SizedBox(
                                  width: 167,
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      decoration: TextDecoration.none,
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
                ),
              ),
              Positioned(
                left: 24,
                top: 629,
                child: Container(
                  width: 311,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 311,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0D1F60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 61,
                        top: 12,
                        child: SizedBox(
                          width: 190,
                          height: 14,
                          child: Text(
                            'LOG IN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 169,
                top: 675,
                child: SizedBox(
                  width: 23,
                  child: Text(
                    'Or',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 134,
                top: 695,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MonitoringPage()),
                    );
                  },
                child: SizedBox(
                  width: 92,
                  child: Text(
                    'Click here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0D1F60),
                      fontSize: 17,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
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
