import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ritstudent/screens/mainScreen.dart';
import 'package:ritstudent/screens/signin/signin.dart';
import 'package:ritstudent/screens/sis/sisscreen.dart';
import 'package:ritstudent/screens/subject/subjectmodel.dart';

var _subjectName;
var _subjectCode;
var _test1Marks;
var _test2Marks;
late String _userName;
late String _userUSN;
var _cieMarks;
var _aq1marks;
var _aq2marks;
var _attendance;
var _for75;
var _for85;
var _cgpa;
var _sgpa;

class SisLoad extends StatefulWidget {
  @override
  _SisLoadState createState() => _SisLoadState();
}

class _SisLoadState extends State<SisLoad> {
  late Future<SubjectModel> futuresubject;
  Future<SubjectModel> fetchData(token) async {
    final response = await get(
        Uri.parse('https://msritstudent.herokuapp.com/getinfo'),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      print('response.statusCode : 200');
      print('response : $response');
      print('response.body : ${response.body}');
    } else
      print('something wrong');
    return SubjectModel.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuresubject = fetchData(token);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<SubjectModel>(
        future: futuresubject,
        builder: (context, snapshot) {
          final users = snapshot.data;
          print("snapshot.data : ${snapshot.data}");
          print("snapshot.error : ${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );

            default:
              print("snapshot.hasError : ${snapshot.hasError}");
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some Error Occurred'),
                );
              } else {
                print(users!.username);
                _userName = users.username;
                _userUSN = users.msg;
                return buildUsers(users);
              }
          }
        },
      ),
    );
  }

  Widget buildUsers(SubjectModel users) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(users.username),
    );
  }
}
