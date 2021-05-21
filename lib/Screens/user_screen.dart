import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/user_screen_arguments.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/user_screen_menu.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user';
  @override
  Widget build(BuildContext context) {
    final UserScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as UserScreenArguments;
    return Scaffold(
      appBar: customAppBar(Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Settings',
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
      )),
      body: CustomContainer(
        child: userScreenMenu(
          args.email!,
          context,
        ),
      ),
    );
  }
}
