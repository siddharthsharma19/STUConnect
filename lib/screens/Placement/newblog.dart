import 'package:flutter/material.dart';
import 'package:ritstudent/screens/Event/event.dart';
import 'package:ritstudent/screens/Placement/placement.dart';

class NewBlog extends StatelessWidget {
  late final String blogdata;
  TextEditingController blogdatacontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose new: "),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            maxLines: 1,
            textInputAction: TextInputAction.next,
            controller: usernamecontroller,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                label: Text("Username"), border: InputBorder.none),
          ),
          TextField(
            maxLines: 15,
            minLines: null,
            textInputAction: TextInputAction.next,
            controller: blogdatacontroller,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                label: Text("What do you want to talk about?"),
                border: InputBorder.none),
          ),
          TextButton(
              onPressed: () {
                if (blogdatacontroller.text.length != 0 &&
                    usernamecontroller.text.length != 0) {
                  username.insert(0, usernamecontroller.text);
                  blog.insert(0, blogdatacontroller.text);
                  time.insert(0, DateTime.now().toString());
                  Navigator.pop(context);
                }
              },
              child: Text("Submit")),
        ]),
      ),
    );
  }
}
