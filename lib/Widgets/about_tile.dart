import 'package:erledigt/Widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

Widget aboutTile(BuildContext context) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, '/about'),
    child: customListTile(
      Icon(Icons.info_outline),
      'About',
    ),
  );
}
