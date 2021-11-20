import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:http/http.dart';
import 'package:STUConnect/constants.dart';
import 'package:STUConnect/screens/signin/signin.dart';
import 'package:STUConnect/screens/subject/subjectmodel.dart';

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
                return buildUsers(users);
              }
          }
        },
      ),
    );
  }

  Widget buildUsers(SubjectModel users) {
    List<dynamic> subject = users.sub;
    List<dynamic> test1marks = users.test1marks;
    List<dynamic> test2marks = users.test2marks;
    List<dynamic> aq1marks = users.aq1marks;
    List<dynamic> aq2marks = users.aq2marks;
    List<dynamic> attendance = users.attendance;
    List<dynamic> subcode = users.subcode;
    List<dynamic> for75 = users.for75;
    List<dynamic> for85 = users.for85;
    List<dynamic> ciemarks = users.ciemarks;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //       colors: [gradientStartColor, gradientEndColor],
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       stops: [0.3, 0.7]),
          // ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'SIS',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Marks and Attendance',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Swiper(
                    itemCount: subject.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 30,
                    layout: SwiperLayout.STACK,
                    // pagination: SwiperPagination(
                    //   builder:
                    //       DotSwiperPaginationBuilder(activeSize: 10, space: 5),
                    // ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        //   Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //       pageBuilder: (context, a, b) => DetailPage(
                        //         planetInfo: subjects[index],
                        //       ),
                        //     ),
                        //   );
                        // },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.deepPurple[50],
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 100),
                                        Text(
                                          subcode[index],
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(subject[index],
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.left),
                                        SizedBox(height: 32),
                                        Table(
                                          children: [
                                            TableRow(
                                              children: [
                                                Text(
                                                  'Test 1',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[900],
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'Test 2',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[900],
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'A / Q 1',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[900],
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'A / Q 2',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[900],
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'CIE',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[900],
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            TableRow(children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Text(
                                                test1marks[index],
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                test2marks[index],
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                aq1marks[index],
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                aq2marks[index],
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                ciemarks[index],
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ]),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Attendance',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[700],
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  attendance[index],
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 18,
                                                    color:
                                                        Colors.deepPurple[700],
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Classes you can skip',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 14,
                                                    color:
                                                        Colors.deepPurple[700],
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'for 85%',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Avenir',
                                                              fontSize: 14,
                                                              color: Colors
                                                                      .deepPurple[
                                                                  700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            for85[index],
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Avenir',
                                                              fontSize: 18,
                                                              color: Colors
                                                                      .deepPurple[
                                                                  700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'for 75%',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Avenir',
                                                              fontSize: 14,
                                                              color: Colors
                                                                      .deepPurple[
                                                                  700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            for75[index],
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Avenir',
                                                              fontSize: 18,
                                                              color: Colors
                                                                      .deepPurple[
                                                                  700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Hero(
                            //   tag: subjects[index].position,
                            //   child: Text(subjects[index].subCode),
                            // ),
                            Positioned(
                              right: MediaQuery.of(context).size.width * 0.2,
                              bottom: MediaQuery.of(context).size.height * 0.28,
                              child: Text(
                                subcode[index],
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 100,
                                  color: primaryTextColor.withOpacity(0.10),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
