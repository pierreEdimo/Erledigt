import 'package:erledigt/Model/create_list.dart';
import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:provider/provider.dart';

Widget addListForm(
  TextEditingController controller,
  BuildContext context,
) {
  return Form(
    child: Column(
      children: [
        nameInput(
          controller,
          'Create a new List',
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            cancelTextButton(context),
            TextButton(
              onPressed: () async {
                if (controller.text.isNotEmpty) {
                  String? userId = await storage.read(key: 'userId');
                  CreateList newList = CreateList(
                    userId: userId,
                    name: controller.text,
                    emojiUrl: '☰',
                  );
                  ListModel list =
                      await Provider.of<ListService>(context, listen: false)
                          .createList(newList);

                  Navigator.of(context).pop();

                  Navigator.pushNamed(
                    context,
                    ListDetailScreen.routeName,
                    arguments: ListDetailArguments(list.id, list.name),
                  );

                  controller.text = "";
                }
                DoNothingAction();
              },
              child: Text("save"),
            )
          ],
        )
      ],
    ),
  );
}
