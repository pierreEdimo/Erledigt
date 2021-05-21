import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Screens/edit_list_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget listMenu(
  BuildContext context,
  String name,
  int id,
) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pop();

          Navigator.pushNamed(
            context,
            EditListScreen.routeName,
            arguments: EditListArguments(name, id),
          );
        },
        child: listTile(
          Icon(Icons.edit_outlined),
          'edit List',
        ),
      ),
      InkWell(
        onTap: () {
          Provider.of<ListService>(context, listen: false).deleteList(id);

          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          );
        },
        child: listTile(
          Icon(Icons.delete_outlined),
          'delete List',
        ),
      ),
      InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: listTile(
          Icon(Icons.cancel_outlined),
          'cancel',
        ),
      ),
    ],
  );
}
