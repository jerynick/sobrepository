import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'control.dart';
import 'package:ecasa_app/buttom_nav.dart';

class LcdCustom extends StatefulWidget {
  @override
  _LcdCustomState createState() => _LcdCustomState();
}

class _LcdCustomState extends State<LcdCustom> {
  int _selectedIndex = 0;

  String text1 = "Text Line 1";
  String text2 = "Text Line 2"; 
  
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.reference();

  void initState() {
    super.initState();
    DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();

      firebaseRef.onValue.listen((event) {
        try {
          if (event.snapshot.value != null) {
            final dynamic data = event.snapshot.value;
            setState(() {
              text1 = (data['/LCD/Line_1'] as String?) ?? '';
              text2 = (data['/LCD/Line_2'] as String?) ?? '';
            });
          }
        } catch (e) {
          print('Error: $e');
        }
      });
    }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: SingleChildScrollView(
      child: Column(
      children: [
        Container(
          width: 360,
          height: 795,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 35,
                child: Container(
                  width: 360,
                  height: 165.67,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/control.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 372,
                child: Container(
                  width: 308,
                  height: 87,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 308,
                          height: 36,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 308,
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
                                left: 12,
                                top: -5,
                                child: SizedBox(
                                  width: 167,
                                  child: TextField(
                                    controller: _textField1Controller,
                                    maxLength: 16,
                                    decoration: InputDecoration(
                                      hintText: '$text1 Text Field 1'
                                    ),
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
                              Positioned(
                                left: 0,
                                top: 3,
                                child: Container(width: 30, height: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 51,
                        child: Container(
                          width: 308,
                          height: 36,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 308,
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
                                left: 12.41,
                                top: -5,
                                child: SizedBox(
                                  width: 167,
                                  child: TextField(
                                    controller: _textField2Controller,
                                    maxLength: 16,
                                    decoration: InputDecoration(
                                      hintText: '$text2 Text Field 2'
                                    ),
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
                left: 89,
                top: 665,
                child: Container(
                  width: 182,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 182,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFF600D0D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 10,
                        child: GestureDetector (
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ControlPage()),
                            );
                          },
                        child: SizedBox(
                          width: 111,
                          height: 16,
                          child: Text(
                            'EXIT',
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
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 611,
                child: Container(
                  width: 126,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 126,
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
                        left: 41,
                        top: 10,
                        child: GestureDetector (
                          onTap: () {
                            _saveToDatabase();
                          },
                        child: SizedBox(
                          width: 44,
                          height: 16,
                          child: Text(
                            'SAVE',
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    ),
    bottomNavigationBar: CustomBottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
    );
  }

  void _saveToDatabase() {
    String text1 = _textField1Controller.text;
    String text2 = _textField2Controller.text;

    // Save to Firebase Realtime Database
    _databaseRef.child('LCD').update({
      'Line_1': text1,
      'Line_2': text2,
    });

    // Show a snackbar or other feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data saved successfully.'),
      ),
    );

}


}