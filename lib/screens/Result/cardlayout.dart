import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ritstudent/screens/Result/resultinfo.dart';

class CardLayout extends StatelessWidget {
  CardLayout(this.semester);
  final int semester;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                'Semester: ${semester + 1}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CGPA: ${semRes[semester].cgpa}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                    Text('SGPA: ${semRes[semester].sgpa}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
