import 'package:flutter/material.dart';
import 'package:ritstudent/screens/Placement/blog.dart';
import 'package:ritstudent/screens/Placement/newblog.dart';

class PlacementScreen extends StatefulWidget {
  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

List<String> username = [
  "Siddharth S",
  "Dushyant Pancholi",
  "Durlabh Kumar",
  "UserX",
  "UserY"
];

List<String> time = ['1d ago', '2d ago', '5d ago', '1m ago', '1y ago'];
List<String> blog = [
  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
  'React Native is an open-source UI software framework created by Meta Platforms, Inc.[3] It is used to develop applications for Android,[4] Android TV,[5] iOS, macOS,[6] tvOS,[7] Web,[8] Windows[6] and UWP[9] by enabling developers to use the React framework along with native platform capabilities.[10] It is also being used to develop virtual reality applications at Oculus.',
  'The Native Development Kit (NDK) is a set of tools that allows you to use C and C++ code with Android, and provides platform libraries you can use to manage native activities and access physical device components, such as sensors and touch input.',
  'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification. JavaScript is high-level, often just-in-time compiled and multi-paradigm. It has dynamic typing, prototype-based object-orientation and first-class functions.',
  'C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or "C with Classes". The language has expanded significantly over time, and modern C++ now has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation.'
];
List<String> url = [
  'https://source.unsplash.com/random',
  'https://source.unsplash.com/random',
  'https://source.unsplash.com/random',
  'https://source.unsplash.com/random',
  'https://source.unsplash.com/random'
];

List<int> likes = [22, 23, 45, 243, 24];

List<int> comments = [12, 13, 5, 53, 24];

bool isLiked = false;

class _PlacementScreenState extends State<PlacementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => Container(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(username[index][0]),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Text(
                              username[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(time[index]),
                          ],
                        ))
                  ],
                ),
                Divider(),
                Text(blog[index]),
                // ReadMore(
                //   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                //   trimLines: 2,
                //   colorClickableText: Colors.pink,
                //   trimMode: TrimMode.Line,
                //   trimCollapsedText: '...more',
                //   trimExpandedText: ' less',
                // ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Image.network(url[index]),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${likes[index]} likes'),
                    Text('${comments[index]} comments')
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 18,
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                            if (isLiked) {
                              likes[index] += 1;
                            } else {
                              likes[index] -= 1;
                            }
                          });
                        },
                        color: isLiked ? Colors.blue : Colors.grey,
                        icon: Icon(Icons.thumb_up_rounded)),
                    IconButton(
                        iconSize: 15,
                        onPressed: () {},
                        icon: Icon(Icons.add_comment_rounded)),
                    IconButton(
                      iconSize: 15,
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                )
              ])),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          print("Entering new blog");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewBlog()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
