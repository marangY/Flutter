import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Future<DateTime?> selectedDate = showDatePicker(
                context: context,
                initialDate: DateTime.now(), // 초깃값
                firstDate: DateTime(2018), // 시작일
                lastDate: DateTime(2030), // 마지막일
                builder: (BuildContext context, Widget? child) { // 테마설정
                  return Theme(
                    data: ThemeData.dark(), // 다크테마
                    child: child!,
                  );
                },
              );
              // Future 타입은 then() 메서드를 사용해 결과를 받는 함수를 작성할 수 있음
              selectedDate.then((dateTime) {
                setState(() {
                  _selectedTime = dateTime;
                });
              });
            },
            child: Text('Date Picker'),
          ),
          Text('$_selectedTime'),
        ],
      ),
    );
  }
}
