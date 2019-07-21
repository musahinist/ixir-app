import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class RadialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: RadialMenu(),
    );
  }
}

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.elasticOut,
          ),
        ),
        super(key: key);
  build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: scale.value - 1.5,
              child: FloatingActionButton(
                child: Icon(Icons.close),
                onPressed: _close,
                backgroundColor: Color(0xffff0000),
              ),
            ),
            Transform.scale(
              scale: scale.value,
              child: FloatingActionButton(
                child: Icon(Icons.account_circle),
                onPressed: _open,
              ),
            ),
          ],
        );
      },
    );
  }

  _buildButton(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: prefix0.Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _close(),
      ),
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
