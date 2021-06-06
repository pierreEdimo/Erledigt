import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/description_input.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController _controller = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

Widget addListForm(
  BuildContext context,
) {
  return Form(
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          nameInput(
            _controller,
            'Create a new List',
            true,
          ),
          SizedBox(
            height: 20.0,
          ),
          descriptionInput(
            _descriptionController,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cancelTextButton(context),
              TextButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    ListModel newList = new ListModel(
                      name: _controller.text,
                      description: _descriptionController.text,
                    );

                    Provider.of<ListService>(context, listen: false)
                        .createNewList(newList);

                    Navigator.of(context).popAndPushNamed(
                      ListDetailScreen.routeName,
                      arguments: ListDetailArguments(newList),
                    );

                    _controller.clear();
                    _descriptionController.clear();
                  }
                  DoNothingAction();
                },
                child: Text(
                  "save",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
