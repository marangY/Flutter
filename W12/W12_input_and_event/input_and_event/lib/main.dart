import 'package:flutter/material.dart';

import 'package:input_and_event/input/textfield_page.dart';
import 'package:input_and_event/input/check_switch_page.dart';
import 'package:input_and_event/input/radio_page.dart';
import 'package:input_and_event/input/dropdown_page.dart';
import 'package:input_and_event/input/alert_dialog_page.dart';
import 'package:input_and_event/input/date_picker_page.dart';
import 'package:input_and_event/input/time_picker_page.dart';
import 'package:input_and_event/input/gesture_page.dart';
import 'package:input_and_event/input/hero_page.dart';
import 'package:input_and_event/input/animated_container_page.dart';
import 'package:input_and_event/input/cupertino_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      //TextFieldPage(),
      //CheckSwitchPage(),
      //RadioPage(),
      //DropdownPage(),
      //AlertDialogPage(),
      //DatePickerPage(),
      //imePickerPage(),
      //GesturePage(),
      //HeroPage(),
      //AnimatedContainerPage(),
      CupertinoPage(),
    );
  }
}