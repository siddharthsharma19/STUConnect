import 'package:flutter/material.dart';
import 'package:ritstudent/screens/Result/cardlayout.dart';
import 'package:ritstudent/screens/Result/resultinfo.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    itemBuilder: (BuildContext context, int index) =>
                        new CardLayout(index),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: semRes.length))
          ],
        )),
      ),
    );
  }
}
