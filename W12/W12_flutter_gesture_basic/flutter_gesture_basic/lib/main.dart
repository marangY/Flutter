import 'package:flutter/material.dart';
/*
Copy from https://medium.com/@omlondhe/gestures-and-pointers-in-flutter-1fce028feeaa

The gesture system in Flutter has two separate layers.

1. Raw pointer events that describe the location and movement of pointers (for example, touches, mice, and styli) across the screen.
2. Gestures that describe semantic actions that consist of one or more pointer movements.

Pointers
  This provides raw data about user interaction, there are four types of pointer events.

  (1) PointerDownEvent
  (2) PointerMoveEvent
  (3) PointerUpEvent
  (4) PointerCancelEvent
  These four events are self-explanatory, to listen to any of them directly from the widget layer, we can use a Listener widget.

Gestures
  There are different methods for gestures and they are categorized into the following types.

  (1) Tap
  (2) Double-tap
  (3) Long press
  (4) Vertical drag
  (5) Horizontal drag
  (5) Pan

Adding Gesture detection
  We can use GestureDetector to detect gestures from the widget layer. InkWell can also be used.

 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Gesture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // user defined function
  void _showDialog(BuildContext context, String strMessage) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("제목을 표시합니다."),
          content: Text("$strMessage"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("닫기"),
              onPressed: () {
                Navigator.of(context).pop(); // 대화상자 닫기
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: GestureDetector(
              onTap: () {
                _showDialog(context, "onTap");
              },
              onDoubleTap: () {
                _showDialog(context, "onDoubleTap");
              },
              onLongPress: () {
                _showDialog(context, "onLongPress");
              },
              child: Text('여기를 탭하세요',)
          )
        ),
      );
  }
}
