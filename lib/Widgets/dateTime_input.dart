import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime? _selectedDate;

Widget dateTimeInput(
  TextEditingController? controller,
  BuildContext context,
) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
      fontSize: 12.0,
    ),
    onTap: () => _selectDate(context, controller!),
    decoration: InputDecoration(
      hintText: "Due date",
      filled: true,
      fillColor: Colors.grey.shade100,
      border: InputBorder.none,
    ),
  );
}

_selectDate(
  BuildContext context,
  TextEditingController? controller,
) async {
  DateTime? newDate = await showDatePicker(
    context: context,
    initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2025),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark().copyWith(),
        child: child!,
      );
    },
  );

  if (newDate != null) {
    _selectedDate = newDate;
    controller!
      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate!)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }
}
