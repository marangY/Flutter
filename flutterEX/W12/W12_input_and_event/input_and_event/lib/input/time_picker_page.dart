import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimePicker'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {  // TimeOfDay 에는 시간과 분 정보가 들어있음
              Future<TimeOfDay?> selectedTime = showTimePicker(
                initialTime: TimeOfDay.now(),  // 현재 시간 설정
                context: context,
              );

              selectedTime.then((timeOfDay) {
                setState(() {
                  _selectedTime = '${timeOfDay?.hour}:${timeOfDay?.minute}';
                });
              });
            },
            child: Text('Time Picker'),
          ),
          Text('$_selectedTime'),
        ],
      ),
    );
  }
}
