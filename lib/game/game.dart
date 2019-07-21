import 'package:flutter/material.dart';
import 'package:sample_fltr/game/drag_box.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int num;
  bool correction;
  @override
  void initState() {
    super.initState();
    num = 0;
    correction = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.orangeAccent[400],
                Colors.pinkAccent[400],
                //   Colors.cyanAccent[400],
              ])),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "TOPICS",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
                ),
                IconButton(
                  icon: Icon(Icons.pause_circle_outline),
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
        ),
        DragBox(
            Offset(MediaQuery.of(context).size.width / 2 - 50,
                MediaQuery.of(context).size.height / 2 - 50),
            "Five",
            Colors.white30,
            5),
        _dragTargetBox(
            Offset(MediaQuery.of(context).size.width / 2 - 100,
                MediaQuery.of(context).size.height - 250),
            6),
        _dragTargetBox(
            Offset(MediaQuery.of(context).size.width / 2 - 100, 50.0), 5),
      ],
    );
  }

  Widget _dragTargetBox(Offset offset, int value) {
    return Positioned(
      left: offset.dx,
      bottom: offset.dy,
      child: DragTarget(
        onWillAccept: (int data) {
          return value == 5;
        },
        onAccept: (int data) {
          num = data;
        },
        builder: (
          BuildContext context,
          List<int> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: accepted.isEmpty ? Colors.transparent : Colors.white30,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Center(
              child: Text(
                num.toString(),
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
