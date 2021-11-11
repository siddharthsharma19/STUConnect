import 'package:flutter/material.dart';

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Notice'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(
            child: Text('Notice Screen'),
          ),
        ),
      ),
    );
  }
}
