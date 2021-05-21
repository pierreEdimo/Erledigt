import 'package:erledigt/Widgets/custom_list_tile.dart';
import 'package:erledigt/main.dart';
import 'package:flutter/material.dart';

_logout(BuildContext context) {
  storage.deleteAll();
  Navigator.of(context).pushNamedAndRemoveUntil(
    '/',
    (route) => false,
  );
}

Widget logout(BuildContext context) {
  return InkWell(
    onTap: () => _logout(context),
    child: customListTile(
      Icon(Icons.logout),
      'logout',
    ),
  );
}
