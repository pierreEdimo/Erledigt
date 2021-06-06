import 'package:flutter/material.dart';

TimeOfDay? _selectedTime;

String? _hour, _minute, _time;

Widget hourInput(BuildContext context, TextEditingController? controller) {
  return TextFormField(
    controller: controller!,
    style: TextStyle(
      fontSize: 12.0,
    ),
    onTap: () => _selecTime(context, controller),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Due Time',
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
  );
}

_selecTime(
  BuildContext context,
  TextEditingController? controller,
) async {
  TimeOfDay? newTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) => Theme(
      data: ThemeData.dark().copyWith(),
      child: child!,
    ),
  );

  if (newTime != null) {
    _selectedTime = newTime;
    _hour = _selectedTime!.hour.toString();
    _minute = _selectedTime!.minute.toString();
    _time = _hour! + ":" + _minute!;
    controller!..text = _time!;
  }
}
