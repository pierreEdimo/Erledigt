import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

String _source =
    "**Erledigt** is a simple ToDo application developped by [Pierre Edimo](mailto:pierredimo@live.com). " +
        "\n With **Erledigt** , you can create , read , update and delete List. When created you can " +
        "you can add a new Task , or multiple new Tasks. when the task is completed you can check it off. If you want you can edit a Task or delete it.";

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Container(
          color: Color(0xffbffffff),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
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
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Markdown(
          padding: EdgeInsets.zero,
          data: _source,
          onTapLink: (text, String? url, title) {
            launch(url!);
          },
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
