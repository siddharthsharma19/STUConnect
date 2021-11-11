import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:ritstudent/constants.dart';
import 'package:ritstudent/screens/subject/subjects.dart';

class SisScreen extends StatefulWidget {
  @override
  _SisScreenState createState() => _SisScreenState();
}

class _SisScreenState extends State<SisScreen> {
  @override
  Widget build(BuildContext context) {
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
                    itemCount: subjects.length,
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
                                          subjects[index].subCode,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(subjects[index].subName,
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
                                                subjects[index].test1,
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                subjects[index].test2,
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                subjects[index].assignment1,
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                subjects[index].assignment2,
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: Colors.deepPurple[700],
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                subjects[index].cie,
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
                                                  subjects[index].attendance,
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
                                                            subjects[index]
                                                                .for85,
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
                                                            subjects[index]
                                                                .for75,
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
                                subjects[index].subCode,
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
