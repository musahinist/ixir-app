import 'package:flutter/material.dart';

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final int data;
  DragBox(this.initPos, this.label, this.itemColor, this.data);
  @override
  _DragBoxState createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.data,
          child: Container(
              decoration: BoxDecoration(
                color: widget.itemColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              width: 100.0,
              height: 100.0,
              child: _textConteiner(26.0)),
          feedback: Container(
            width: 150.0,
            height: 150.0,
            child: _textConteiner(20.0),
          ),
          childWhenDragging: Container(),
        ));
  }

  Widget _textConteiner(double size) {
    return Center(
      child: Text(
        widget.label,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: size,
        ),
      ),
    );
  }
}
