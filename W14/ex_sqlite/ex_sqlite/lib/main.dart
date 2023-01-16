import 'package:flutter/material.dart';
import 'package:ex_sqlite/crud_sqlite.dart';

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
      home: MyHomePage(),
      //
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  void dbdemo() async {
    List<MemoMoney> memos = [];
    int curid = 0;
    MemomonyHelper dbHelper = MemomonyHelper();
    await dbHelper.initDB().then((value) async{
      await dbHelper.insert(MemoMoney(title: '점심', expenses: 7000));
      memos = await dbHelper.getAllMemos();
      curid = memos[0].id!;
      print(memos);

      MemoMoney? memo = await dbHelper.getMemo(curid);
      print(memo);

      await dbHelper.update(MemoMoney(id: curid, title: '점심', expenses: 8000));
      memos = await dbHelper.getAllMemos();
      print(memos);

      await dbHelper.delete(curid);
      memos = await dbHelper.getAllMemos();
      print(memos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Text(
        "sqlite demo",
        style: TextStyle(fontSize: 40),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbdemo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}