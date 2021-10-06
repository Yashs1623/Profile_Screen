import 'package:flutter/material.dart';
import 'dart:io';

class SavingPage extends StatefulWidget {
  final user_email;
  final user_mobile_number;
  final user_image_path;
  final user_full_name;
  final user_birthdate;
  final user_age;

  SavingPage({
    this.user_full_name,
    this.user_email,
    this.user_mobile_number,
    this.user_birthdate,
    this.user_age,
    this.user_image_path,
  });

  @override
  _SavingPageState createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  Size screenSize() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 0.5),
            colors: <Color>[
              Color(0xFF26867c),
              Color(0xFF33b3a6),
              Color(0xFF88DCE6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize().height * 0.035,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Container(
                    height: 275,
                    width: screenSize().width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF26867c),
                          blurRadius: 2.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: widget.user_image_path == null
                            ? AssetImage('assets/profile.png')
                            : FileImage(File(widget.user_image_path.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 22.0,
                right: 22.0,
                bottom: screenSize().height * 0.035,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black54,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    height: screenSize().height * 0.068,
                    width: screenSize().width * 0.78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFAFEEEE),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize().height * 0.017,
                        left: screenSize().width * 0.03,
                      ),
                      child: Text(
                        widget.user_full_name,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 22.0,
                right: 22.0,
                bottom: screenSize().height * 0.035,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.black54,
                    size: 29.0,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    height: screenSize().height * 0.068,
                    width: screenSize().width * 0.78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFAFEEEE),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize().height * 0.017,
                        left: screenSize().width * 0.03,
                      ),
                      child: Text(
                        widget.user_email,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 22.0,
                right: 22.0,
                bottom: screenSize().height * 0.035,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.black54,
                    size: 29.0,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    height: screenSize().height * 0.068,
                    width: screenSize().width * 0.78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFAFEEEE),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize().height * 0.017,
                        left: screenSize().width * 0.03,
                      ),
                      child: Text(
                        widget.user_mobile_number,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 22.0,
                right: 22.0,
                bottom: screenSize().height * 0.025,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.cake,
                    color: Colors.black54,
                    size: 29.0,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    height: screenSize().height * 0.068,
                    width: screenSize().width * 0.78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFAFEEEE),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize().height * 0.017,
                        left: screenSize().width * 0.03,
                      ),
                      child: Text(
                        widget.user_birthdate,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize().height * 0.035,
                ),
                child: Text(
                  'Age :  ' + widget.user_age.toString(),
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                    fontFamily: 'SansitaSwashed',
                  ),
                )),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Text(
                    'Edit   Your  Profile',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'SansitaSwashed',
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '<--',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'SansitaSwashed',
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
