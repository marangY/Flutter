import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeroDetailPage()),
            );
          },
          child: Hero(
            tag: 'image',  // 여기서 작성한 태그와 두번째 페이지의 태그가 동일해야 함
            child: Image.asset(
              'assets/sample.jpg',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Detail'),
      ),
      body: Hero(
        tag: 'image',
        child: Image.asset('assets/sample.jpg'),
      ),
    );
  }
}
