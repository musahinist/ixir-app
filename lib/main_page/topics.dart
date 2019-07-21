import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../game/game.dart';

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<WordPair> _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 50.0,
        ),
        ListTile(
          title: Text('Math',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          //  subtitle: Text('My City, CA 99984'),
          leading: Icon(
            Icons.aspect_ratio,
            color: Colors.white,
          ),
        ),
        _buildTopicRows(),
        Divider(),
        ListTile(
          title: Text('Geometry',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          // subtitle: Text('My City, CA 99984'),
          leading: Icon(
            Icons.flare,
            color: Colors.white,
          ),
        ),
        _buildTopicRows(),
        Divider(),
        ListTile(
          title: Text('Chemistry',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          // subtitle: Text('My City, CA 99984'),
          leading: Icon(
            Icons.wb_sunny,
            color: Colors.white,
          ),
        ),
        _buildTopicRows(),
        Divider(),
        ListTile(
          title: Text('Physics',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          // subtitle: Text('My City, CA 99984'),
          leading: Icon(
            Icons.speaker_notes,
            color: Colors.white,
          ),
        ),
        _buildTopicRows(),
        Divider(),
      ],
      physics: BouncingScrollPhysics(),
    );
  }

  // Widget _buildTopic(topics) {}
  Widget _buildTopicRows() {
    return Container(
      //  margin: EdgeInsets.only(top: 5.0),
      color: Colors.transparent,
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          if (i >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(4));
          }
          return _buildCard(_suggestions[i], i);
        },
      ),
    );
  }

  Widget _buildCard(WordPair pair, i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pushGame(pair);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(20.0),
        margin: i == 0
            ? const EdgeInsets.only(left: 20.0)
            : const EdgeInsets.only(left: 10.0),
        width: 160.0,
        child: Text(
          i.toString() + " " + pair.asPascalCase,
        ),
      ),
    );
  }

  void _pushGame(pair) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            body: Game(),
          );
        },
      ),
    );
  }
}
