import 'package:flutter/material.dart';
import 'package:ritstudent/screens/Event/event.dart';
import 'package:ritstudent/screens/Notes/notes.dart';
import 'package:ritstudent/screens/Placement/placement.dart';
import 'package:ritstudent/screens/Result/resultscreen.dart';
import 'package:ritstudent/screens/signin/signin.dart';
import 'package:ritstudent/screens/sis/sisload.dart';
import 'package:ritstudent/screens/sis/sisscreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    SisLoad(),
    ResultScreen(),
    NotesScreen(),
    PlacementScreen(),
  ];
  @override
  Widget build(BuildContext context) {
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
                    // _auth.signOut();
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SigninScreen()));
                  },
                  icon: Icon(Icons.logout_rounded))
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                Container(
                  child: UserAccountsDrawerHeader(
                    accountEmail: Text("users.username",
                        style: Theme.of(context).textTheme.bodyText1),
                    accountName: Text(
                      usn,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 10,
                      child: Text(usn),
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
                                onPressed: () => Navigator.pop(
                                    context, true), // passing true
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
          body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.workspaces_filled), label: 'SIS'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.note_add), label: 'Result'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_task_outlined), label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.next_plan_outlined), label: 'Placement'),
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
