import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'app_bar_positioned.dart';
import 'topics.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.pinkAccent[400],
                  //   Colors.cyanAccent[400],
                  Colors.orangeAccent[400]
                ])),
          ),
          Topics(),
          AppBarPositioned(),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.pink[900],
      //   child: new Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.list),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.filter_none),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.favorite_border),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.perm_identity),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        // buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.orangeAccent[400],

        height: 50.0,
        color: Colors.pink[900],
        index: 2,
        items: <Widget>[
          Icon(Icons.add),
          Icon(Icons.list),
          Icon(Icons.perm_identity),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
