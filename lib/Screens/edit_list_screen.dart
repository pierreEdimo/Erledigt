import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/description_input.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditListScreen extends StatelessWidget {
  static const routeName = 'editList';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final EditListArguments args =
        ModalRoute.of(context)!.settings.arguments as EditListArguments;

    _controller.text = args.listModel.name!;
    _descriptionController.text = args.listModel.description!;

    return Scaffold(
      appBar: customAppBar(
        Container(
          color: Color(0xffbffffff),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(
                  Icons.close,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Form(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      nameInput(
                        _controller,
                        "",
                        false,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      descriptionInput(
                        _descriptionController,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      ListModel listModel = ListModel(
                        name: _controller.text,
                        description: _descriptionController.text,
                      );

                      Provider.of<ListService>(context, listen: false)
                          .editList(args.listModel.key, listModel);
                    }
                  },
                  child: Text(
                    "save",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
