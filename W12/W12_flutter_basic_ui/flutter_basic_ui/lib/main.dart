import 'package:flutter/material.dart';

import 'package:flutter_basic_ui/screen/stack_page.dart';
import 'package:flutter_basic_ui/screen/single_child_scrollview_page.dart';
import 'package:flutter_basic_ui/screen/listview_page.dart';
import 'package:flutter_basic_ui/screen/gridview_page.dart';
import 'package:flutter_basic_ui/screen/pageview_page.dart';
import 'package:flutter_basic_ui/screen/tab_page.dart';
import 'package:flutter_basic_ui/screen/bottom_navigationbar_page.dart';
import 'package:flutter_basic_ui/screen/center_page.dart';
import 'package:flutter_basic_ui/screen/padding_page.dart';
import 'package:flutter_basic_ui/screen/align_page.dart';
import 'package:flutter_basic_ui/screen/expanded_page.dart';
import 'package:flutter_basic_ui/screen/sizedbox_page.dart';
import 'package:flutter_basic_ui/screen/card_page.dart';
import 'package:flutter_basic_ui/screen/button_page.dart';
import 'package:flutter_basic_ui/screen/text_page.dart';
import 'package:flutter_basic_ui/screen/image_page.dart';
import 'package:flutter_basic_ui/screen/progress_page.dart';
import 'package:flutter_basic_ui/screen/circleavatar_page.dart';

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
      //StackPage(),
      //SingleChildScrollViewPage(),
      //ListViewPage(),
      //GridViewPage(),
      //PageViewPage(),
      //TabPage(),
      //BottomNavigationBarPage(),
      //CenterPage(),
      //PaddingPage(),
      //AlignPage(),
      //ExpandedPage(),
      //SizedBoxPage(),
      //CardPage(),
      //ButtonPage(),
      //TextPage(),
      //ImagePage(),
      //ProgressPage(),
      CircleAvatarPage(),
    );
  }
}
