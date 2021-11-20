import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:STUConnect/screens/Placement/readmore.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Row(
              children: [
                CircleAvatar(),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("1d ago")
                      ],
                    ))
              ],
            ),
            Divider(),
            Text(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
            // ReadMore(
            //   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            //   trimLines: 2,
            //   colorClickableText: Colors.pink,
            //   trimMode: TrimMode.Line,
            //   trimCollapsedText: '...more',
            //   trimExpandedText: ' less',
            // ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 15,
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up_alt_rounded)),
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
    );
  }
}
