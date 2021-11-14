import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ritstudent/constants.dart';
import 'package:ritstudent/screens/mainScreen.dart';
import 'package:ritstudent/screens/signin/authservice.dart';
import 'package:ritstudent/screens/sis/sisload.dart';

final usncontroller = TextEditingController();
final passwordcontroller = TextEditingController();

late String usn;
late String password;
late String token;

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _isHidden = true;
  DateTime _selectedDate = DateTime.now();
  String date = DateTime.now().toString();
  bool isLoading = false;

  // @override
  // void initState() {
  //   passwordcontroller.addListener(_passwordcontrollerlistener);
  //   super.initState();
  // }

  // void _passwordcontrollerlistener() {
  //   password = passwordcontroller.text;
  // }

  // @override
  // void dispose() {
  //   passwordcontroller.removeListener(_passwordcontrollerlistener);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Image.asset(
                      MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? "assets/images/logo.png"
                          : "assets/images/logo1.png",
                      height: 146,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      controller: usncontroller,
                      onChanged: (value) {
                        usn = value;
                      },
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.email_rounded),
                          labelText: "USN",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: _isHidden,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2000),
                                        firstDate: DateTime(1995),
                                        lastDate: DateTime(2007))
                                    .then((selectedDate) {
                                  if (selectedDate != null) {
                                    _selectedDate = selectedDate;
                                    passwordcontroller.text =
                                        DateFormat.yMd().format(_selectedDate);
                                  }
                                });

                                // if (picked != null) {
                                //   setState(() {
                                //     _selectedDate = picked;
                                //   });
                                //   passwordcontroller.text =
                                //       picked.toString().substring(0, 10);
                                // }
                              },
                              icon: Icon(Icons.date_range_rounded)),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          labelText: "DOB: M/D/Y",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //New way
                  !isLoading
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            minimumSize: Size.fromHeight(55),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await login();
                            setState(() {
                              isLoading = true;
                            });
                          },
                          child: Text('Sign In'))
                      : Center(child: CircularProgressIndicator())
                  //till here

                  //old way
                  // ElevatedButton(

                  //   child: isLoading
                  //       ? CircularProgressIndicator(color: Colors.white)
                  //       : Text('Sign In'),
                  //   onPressed: () async{
                  //     // print(usn);
                  //     // print(password);
                  //     setState(() => isLoading = true);
                  //     try {
                  //       AuthService().login(usn, password).then((val) {
                  //         if (val.data['success']) {
                  //           token = val.data['token'];
                  //           Navigator.pushReplacement(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => MainScreen()));
                  //           print('Authenticated');
                  //         }
                  //       });
                  //     } on DioError catch (e) {
                  //       print(e.response);
                  //     }
                  //     setState(() => isLoading = false);
                  //   },
                  // )
                  //till here
                ],
              ),
            )),
      ),
    );
  }

//New stuff
  Future login() async {
    try {
      AuthService().login(usn, password).then((val) {
        if (val.data['success']) {
          token = val.data['token'];
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
          print('Authenticated');
        }
      });
    } on DioError catch (e) {
      print(e.response);
    }
  }
//till here

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}