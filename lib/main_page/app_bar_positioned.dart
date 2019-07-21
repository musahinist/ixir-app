import 'package:flutter/material.dart';

class AppBarPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.wb_sunny), //`Icon` to display
              label: Text("16 Items"), //`Text` to display
              onPressed: () {
                //Code to execute
              },
            ),
            Text(
              "TOPICS",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                //Code to execut
              },
            ),
          ],
          // backgroundColor: Colors.transparent,
          // elevation: 0.1,
          // title: Text("Quiz App"),
        ),
      ),
    );
  }
}
