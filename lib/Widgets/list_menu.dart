import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/edit_list_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget listMenu(
  BuildContext context,
  ListModel listModel,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: () => Navigator.popAndPushNamed(
          context,
          EditListScreen.routeName,
          arguments: EditListArguments(listModel),
        ),
        child: listTile(
          Icon(Icons.edit_outlined),
          'edit List',
        ),
      ),
      InkWell(
        onTap: () {
          Provider.of<ListService>(context, listen: false).deleList(listModel);

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
