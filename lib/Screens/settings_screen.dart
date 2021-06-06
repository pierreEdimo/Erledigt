import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Widgets/about_tile.dart';
import 'package:erledigt/Widgets/contact_tile.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        color: Color(0xffbffffff),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Settings",
                style: titleStyle,
              ),
              InkWell(
                child: Icon(
                  Icons.close_outlined,
                ),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      )),
      body: CustomContainer(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                aboutTile(context),
                SizedBox(
                  height: 20.0,
                ),
                contactTile(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
