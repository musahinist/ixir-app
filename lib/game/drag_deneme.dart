import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyDraggableController<String> draggableController;

  @override
  void initState() {
    this.draggableController = new MyDraggableController<String>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Test'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            width: double.infinity,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 30,
                      child: MyDraggable<String>(
                        draggableController,
                        'Test1',
                      ),
                    ),
                    Positioned(
                      left: 230,
                      top: 230,
                      child: MyDraggable<String>(
                        draggableController,
                        'Test2',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DragTarget<String>(
            builder: (context, list, list2) {
              return Container(
                height: 100,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Center(
                  child: Text('TARGET ZONE'),
                ),
              );
            },
            onWillAccept: (item) {
              debugPrint('draggable is on the target $item');
              this.draggableController.onTarget(true, item);
              return true;
            },
            onLeave: (item) {
              debugPrint('draggable has left the target $item');
              this.draggableController.onTarget(false, item);
            },
          ),
        ],
      ),
    );
  }
}

class MyDraggable<T> extends StatefulWidget {
  final MyDraggableController<T> controller;
  final T data;
  MyDraggable(this.controller, this.data, {Key key}) : super(key: key);
  @override
  _MyDraggableState createState() =>
      _MyDraggableState<T>(this.controller, this.data);
}

class _MyDraggableState<T> extends State<MyDraggable> {
  MyDraggableController<T> controller;
  T data;
  bool isOnTarget;
  _MyDraggableState(this.controller, this.data);
  FeedbackController feedbackController;
  @override
  void initState() {
    feedbackController = new FeedbackController();

    this.controller.subscribeToOnTargetCallback(onTargetCallbackHandler);

    super.initState();
  }

  void onTargetCallbackHandler(bool t, T data) {
    this.isOnTarget = t && data == this.data;
    this.feedbackController.updateFeedback(this.isOnTarget);
  }

  @override
  void dispose() {
    this.controller.unSubscribeFromOnTargetCallback(onTargetCallbackHandler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<T>(
      data: this.data,
      feedback: FeedbackWidget(feedbackController),
      childWhenDragging: Container(
        height: 100,
        width: 100,
        color: Colors.blue[50],
      ),
      child: Container(
        height: 100,
        width: 100,
        color: (this.isOnTarget ?? false) ? Colors.green : Colors.blue,
      ),
      onDraggableCanceled: (v, f) => setState(
        () {
          this.isOnTarget = false;
          this.feedbackController.updateFeedback(this.isOnTarget);
        },
      ),
    );
  }
}

class FeedbackController {
  Function(bool) feedbackNeedsUpdateCallback;

  void updateFeedback(bool isOnTarget) {
    if (feedbackNeedsUpdateCallback != null) {
      feedbackNeedsUpdateCallback(isOnTarget);
    }
  }
}

class FeedbackWidget extends StatefulWidget {
  final FeedbackController controller;
  FeedbackWidget(this.controller);
  @override
  _FeedbackWidgetState createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool isOnTarget;

  @override
  void initState() {
    this.isOnTarget = false;
    this.widget.controller.feedbackNeedsUpdateCallback =
        feedbackNeedsUpdateCallbackHandler;
    super.initState();
  }

  void feedbackNeedsUpdateCallbackHandler(bool t) {
    setState(() {
      this.isOnTarget = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: this.isOnTarget ?? false ? Colors.green : Colors.red,
    );
  }

  @override
  void dispose() {
    this.widget.controller.feedbackNeedsUpdateCallback = null;
    super.dispose();
  }
}

class DraggableInfo<T> {
  bool isOnTarget;
  T data;
  DraggableInfo(this.isOnTarget, this.data);
}

class MyDraggableController<T> {
  List<Function(bool, T)> _targetUpdateCallbacks =
      new List<Function(bool, T)>();

  MyDraggableController();

  void onTarget(bool onTarget, T data) {
    if (_targetUpdateCallbacks != null) {
      _targetUpdateCallbacks.forEach((f) => f(onTarget, data));
    }
  }

  void subscribeToOnTargetCallback(Function(bool, T) f) {
    _targetUpdateCallbacks.add(f);
  }

  void unSubscribeFromOnTargetCallback(Function(bool, T) f) {
    _targetUpdateCallbacks.remove(f);
  }
}
