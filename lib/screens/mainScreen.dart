import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:STUConnect/screens/Event/event.dart';
import 'package:STUConnect/screens/Notes/notes.dart';
import 'package:STUConnect/screens/Placement/placement.dart';
import 'package:STUConnect/screens/Result/resultscreen.dart';
import 'package:STUConnect/screens/signin/signin.dart';
import 'package:STUConnect/screens/sis/sisload.dart';
import 'package:STUConnect/screens/subject/subjectmodel.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
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

  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuresubject = fetchData(token);
  }

  static List<Widget> _widgetOptions = <Widget>[
    SisLoad(),
    Result(),
    NotesScreen(),
    PlacementScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SubjectModel>(
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
                name = users.username;
                return Scaffold(
                  body: SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.blueGrey,
                        actions: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NoticeScreen()));
                              },
                              icon: Icon(Icons.notifications)),
                          IconButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Text('Wanna Exit?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, true), // passing false
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              SigninScreen()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                            }, // passing true
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      );
                                    });
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             SigninScreen()),
                                //     (Route<dynamic> route) => false);
                              },
                              icon: Icon(Icons.logout_rounded))
                        ],
                      ),
                      drawer: Drawer(
                        child: ListView(
                          children: [
                            Container(
                              child: UserAccountsDrawerHeader(
                                accountEmail: Text(users.msg,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                accountName: Text(
                                  users.username,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                currentAccountPicture: CircleAvatar(
                                  radius: 10,
                                  child: Image.network(
                                      'https://source.unsplash.com/random'),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text('Join as a developer'),
                              leading: Icon(Icons.cloud_upload_rounded),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Register as admin'),
                              leading: Icon(Icons.app_registration_rounded),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Sign Out'),
                              leading: Icon(Icons.logout_rounded),
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Text('Wanna Exit?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, true), // passing false
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              SigninScreen()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                            }, // passing true
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      );
                                    }).then((exit) {
                                  if (exit == null) return;

                                  if (exit) {
                                    // user pressed Yes button
                                    // _auth.signOut();
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SigninScreen()));
                                  } else {
                                    // user pressed No button
                                    Navigator.pop(context, true);
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      body: IndexedStack(
                          index: _selectedIndex, children: _widgetOptions),
                      bottomNavigationBar: BottomNavigationBar(
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.workspaces_filled),
                              label: 'SIS'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.note_add), label: 'Result'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.add_task_outlined),
                              label: 'Notes'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.next_plan_outlined),
                              label: 'Posts'),
                        ],
                        elevation: 10,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _selectedIndex,
                        selectedItemColor: Colors.amber[800],
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
