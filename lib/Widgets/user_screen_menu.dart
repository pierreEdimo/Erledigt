import 'package:erledigt/Widgets/about_tile.dart';
import 'package:erledigt/Widgets/contact_tile.dart';
import 'package:erledigt/Widgets/custom_list_tile.dart';
import 'package:erledigt/Widgets/log_out_tile.dart';
import 'package:flutter/material.dart';

Widget userScreenMenu(String email, BuildContext context) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Column(
            children: [
              customListTile(
                Icon(
                  Icons.email_outlined,
                ),
                email,
              ),
              SizedBox(
                height: 20,
              ),
              contactTile(context),
              SizedBox(
                height: 20,
              ),
              aboutTile(context),
            ],
          ),
        ),
        logout(context),
      ],
    ),
  );
}
