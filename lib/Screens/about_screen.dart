import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

String _source =
    "**Erledigt** is a simple ToDo application developped by Pierre Edimo. He inspired himself from" +
        "a design he saw on dribbble. \n With **Erledigt** , you can create , read , update and delete List. When created you can " +
        "you can add a new Task , or multiple new Tasks. when the task is completed you can check it off. If you want you can edit a Task or delete it.";

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: titleStyle,
              ),
              IconButton(
                icon: Icon(
                  Icons.close_outlined,
                  color: Color(0xFFBFFFFFF),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
      body: CustomContainer(
        child: Markdown(
          data: _source,
        ),
      ),
    );
  }
}
