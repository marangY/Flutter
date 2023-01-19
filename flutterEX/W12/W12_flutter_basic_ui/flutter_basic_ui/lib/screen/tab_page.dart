import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(  //Scaffold를 감싸고
      length: 3,   // Tab 수를 지정하고
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabPage'),
          bottom: TabBar(  // Scaffold의 bottom에 TabBar를 지정하고
            tabs: <Widget>[  // tabs 에 Tab의 리스트 지정하고
              Tab(icon: Icon(Icons.tag_faces)),
              Tab(text: '메뉴2'),
              Tab(icon: Icon(Icons.info), text: '메뉴3'),
            ],
          ),
        ),
        body: TabBarView(  // scaffold의 body에 TabBarView를 배치한 다음
            children: <Widget>[  // children 에 표시할 화면을 배치함
              Container(color: Colors.yellow,),
              Container(color: Colors.orange,),
              Container(color: Colors.red,),
            ]),
        ),
    );
  }
}
