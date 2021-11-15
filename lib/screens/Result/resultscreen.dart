import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ritstudent/screens/Result/cardlayout.dart';
import 'package:ritstudent/screens/Result/resultinfo.dart';
import 'package:ritstudent/screens/signin/signin.dart';
import 'package:ritstudent/screens/subject/subjectmodel.dart';

class Result extends StatefulWidget {
  Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
    return Container(
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
              List<dynamic> cgpa = users!.cgpa;
              List<dynamic> sgpa = users.sgpa;
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some Error Occurred'),
                );
              } else {
                return Scaffold(
                  body: Container(
                    child: SafeArea(
                        child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Text(
                                'Result',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: ListView.separated(
                              itemCount: users.cgpa.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  new Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.deepPurple[100],
                                child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Semester: ${index + 1}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('SGPA: ${sgpa[index]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.black)),
                                              Text('CGPA: ${cgpa[index]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.black)),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            ))
                      ],
                    )),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
