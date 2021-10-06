import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'SavingPage.dart';

import 'package:profile_screen/SavingPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void showToast(String string) {
    Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFF0A0E21),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Size screenSize() {
    return MediaQuery.of(context).size;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String fullName;
  String email;
  String phoneNumber;
  int age;
  bool checkAge;
  bool check;

  PickedFile imageFile;
  final ImagePicker picker = ImagePicker();

  void ageValidate() {
    if (age == null) {
      showToast('Please set your birthdate');
      checkAge = false;
    } else if (age == 0) {
      showToast('Your age cannot be 0');
      checkAge = false;
    } else {
      checkAge = true;
    }
  }

  void textFieldValidations() {
    if (_formKey.currentState.validate()) {
      print("Validated");
      check = true;
      if (check == true && checkAge == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SavingPage(
              user_full_name: fullName,
              user_email: email,
              user_mobile_number: phoneNumber,
              user_birthdate: date.day.toString() +
                  '/' +
                  date.month.toString() +
                  '/' +
                  date.year.toString(),
              user_age: age,
              user_image_path: imageFile,
            ),
          ),
        );
      }
    }
  }

  String validateFullName(value) {
    String pattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter your fullname";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid fullname";
    }
    return null;
  }

  String validatePhoneNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter your mobile number";
    } else if (!regExp.hasMatch(value) || value.length > 10) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  DateTime date = DateTime.now();
  DateTime todayDate = DateTime.now();
  Future<Null> selectDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1940),
      lastDate: todayDate,
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        age = todayDate.year - date.year;
        print(date.toString());
      });
    }
  }

  Widget bottomSheet() {
    return Container(
      height: screenSize().height * 0.23,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile Picture',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF33b3a6),
                  border: Border.all(color: Colors.black45),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 27,
                      ),
                      SizedBox(
                        width: screenSize().width * 0.045,
                      ),
                      Text(
                        'Take  Photo',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'SansitaSwashed',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF33b3a6),
                  border: Border.all(color: Colors.black45),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 27,
                      ),
                      SizedBox(
                        width: screenSize().width * 0.045,
                      ),
                      Text(
                        'Choose   from  Gallery',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'SansitaSwashed',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize().height * 0.08,
                  bottom: screenSize().height * 0.035,
                ),
                child: Text(
                  'Set   Your  Profile',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'SansitaSwashed',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize().height * 0.035,
                ),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: imageFile == null
                            ? AssetImage('assets/profile.png')
                            : FileImage(File(imageFile.path)),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  bottom: screenSize().height * 0.02,
                ),
                child: Container(
                  height: screenSize().height * 0.089,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFAFEEEE),
                      filled: true,
                      icon: Icon(
                        Icons.person,
                        color: Colors.black54,
                        size: 28.0,
                      ),
                      hintText: 'What do people call you?',
                      labelText: 'Full  Name *',
                      labelStyle: TextStyle(
                        fontFamily: 'SansitaSwashed',
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    onChanged: (value) => fullName = value,
                    validator: validateFullName,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 22.0,
                    right: 22.0,
                    bottom: screenSize().height * 0.02),
                child: Container(
                  height: screenSize().height * 0.089,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFAFEEEE),
                      filled: true,
                      icon: Icon(
                        Icons.email,
                        color: Colors.black54,
                        size: 28.0,
                      ),
                      hintText: 'example@abc.com',
                      labelText: 'Email   Address *',
                      labelStyle: TextStyle(
                          fontFamily: 'SansitaSwashed', fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email cannot be empty"),
                      EmailValidator(errorText: 'Please enter a valid email'),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 22.0,
                    right: 22.0,
                    bottom: screenSize().height * 0.02),
                child: Container(
                  height: screenSize().height * 0.089,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFAFEEEE),
                      filled: true,
                      icon: Icon(
                        Icons.call,
                        color: Colors.black54,
                        size: 28.0,
                      ),
                      hintText: 'Mobile Number',
                      labelText: 'Contact *',
                      labelStyle: TextStyle(
                          fontFamily: 'SansitaSwashed',
                          fontSize: 17.0,
                          color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => phoneNumber = value,
                    validator: validatePhoneNumber,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.0, right: 22.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.cake,
                      size: 28.0,
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFAFEEEE),
                          border: Border.all(color: Colors.black45),
                        ),
                        height: screenSize().height * 0.073,
                        width: screenSize().width * 0.78,
                        child: TextButton(
                          onPressed: () {
                            selectDatePicker(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Birthdate :    ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                  fontFamily: 'SansitaSwashed',
                                ),
                              ),
                              Text(
                                date.day.toString() + '/',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                date.month.toString() + '/',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                date.year.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: screenSize().height * 0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (() {
                        if (age == null) {
                          return '';
                        } else if (age == 0) {
                          return '';
                        } else if (age > 0) {
                          return 'Age :   ';
                        }
                      }()),
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.white,
                        fontFamily: 'SansitaSwashed',
                      ),
                    ),
                    Text(
                      (() {
                        if (age == null) {
                          return '';
                        } else if (age == 0) {
                          return '';
                        } else if (age > 0) {
                          return age.toString();
                        }
                      }()),
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.white,
                        fontFamily: 'SansitaSwashed',
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  ageValidate();
                  textFieldValidations();
                },
                child: Text(
                  'Proceed -->',
                  style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'SansitaSwashed',
                      color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
