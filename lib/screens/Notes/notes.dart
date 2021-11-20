import 'package:flutter/material.dart';
import 'package:STUConnect/constants.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> semester = ['1', '2', '3', '4', '5', '6', '7', '8'];
  List<String> subject = [
    'CS41',
    'CS42',
    'CS43',
    'CS44',
    'CS45',
    'CS46',
    'CS47',
    'CS48'
  ];
  List<String> unit = ['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4', 'Unit 5'];
  String? dropdownsemester;
  String? dropdownsubject;
  String? dropdownunit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    items: semester
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),
                    selectedItemBuilder: (BuildContext context) => semester
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    hint: Center(child: Text('Select Semester')),
                    underline: Container(),
                    value: dropdownsemester,
                    onChanged: (value) {
                      setState(() {
                        dropdownsemester = value.toString();
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    items: subject
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),
                    selectedItemBuilder: (BuildContext context) => subject
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    hint: Center(child: Text('Select Subject')),
                    underline: Container(),
                    value: dropdownsubject,
                    onChanged: (value) {
                      setState(() {
                        dropdownsubject = value.toString();
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: DropdownButton(
                    items: unit
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),
                    selectedItemBuilder: (BuildContext context) => unit
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    hint: Center(child: Text('Select Unit')),
                    underline: Container(),
                    value: dropdownunit,
                    onChanged: (value) {
                      setState(() {
                        dropdownunit = value.toString();
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
