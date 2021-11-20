import 'package:flutter/material.dart';

List<String> notice = [
  'Holiday on this day.',
  'Internals postponed',
  'Course structure updated'
];
List<String> timings = [
  '19/11/2021 10:00AM',
  '18/11/2021 10:00AM',
  '17/11/2021 10:00AM'
];

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
              title: Text('Notifications'),
              backgroundColor: Colors.blueGrey,
            ),
            body: ListView.separated(
                itemBuilder: (BuildContext context, int index) => Container(
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notice[index],
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              timings[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            )
                          ],
                        ))),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: notice.length)),
      ),
    );
  }
}
