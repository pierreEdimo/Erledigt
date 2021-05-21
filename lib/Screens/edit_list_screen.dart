import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/create_list.dart';
import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditListScreen extends StatelessWidget {
  static const routeName = 'editList';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final EditListArguments args =
        ModalRoute.of(context)!.settings.arguments as EditListArguments;
    return Scaffold(
      appBar: customAppBar(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit List",
                  style: titleStyle,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFFBFFFFFF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Form(
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller..text = args.name!,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cancelTextButton(context),
                  TextButton(
                    onPressed: () async {
                      if (_controller.text.isNotEmpty) {
                        String? userId = await storage.read(key: 'userId');
                        CreateList newList = CreateList(
                            userId: userId,
                            emojiUrl: '☰',
                            name: _controller.text);

                        Provider.of<ListService>(context, listen: false)
                            .updateList(newList, args.id!);

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          ListDetailScreen.routeName,
                          ModalRoute.withName('/'),
                          arguments: ListDetailArguments(args.id, newList.name),
                        );
                      }
                    },
                    child: Text("save"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
