import 'package:erledigt/Model/list_model.dart';

import 'package:flutter/material.dart';

Widget listModelContainer(ListModel list, BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              list.emojiUrl!,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(width: 20.0),
            Text(
              list.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        list.taskCount! == 0
            ? Text("")
            : Text(
                list.taskCount!.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
      ],
    ),
  );
}
