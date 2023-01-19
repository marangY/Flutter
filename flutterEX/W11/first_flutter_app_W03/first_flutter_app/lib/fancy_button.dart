import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  Color _getColors() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, color: Colors.white)),
            backgroundColor:
            MaterialStateProperty.all(_getColors())),
        child: widget.child,
        onPressed: widget.onPressed,
      ),
    );
  }
}

final _random = new Random();
int next(int min, int max) => min + _random.nextInt(max - min);

var colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amber,
  Colors.lightBlue
];

var _buttonColors = <_FancyButtonState, Color>{};
