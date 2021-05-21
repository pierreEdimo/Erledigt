import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/future_list_of_tasks.dart';
import 'package:erledigt/Widgets/list_menu.dart';
import 'package:erledigt/Widgets/show_modal.dart';
import 'package:flutter/material.dart';

class ListDetailScreen extends StatelessWidget {
  static const routeName = '/listdetail';

  @override
  Widget build(BuildContext context) {
    final ListDetailArguments args =
        ModalRoute.of(context)!.settings.arguments as ListDetailArguments;

    return Scaffold(
      appBar: customAppBar(
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Color(0xffbffffff),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    args.name!,
                    style: titleStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: Color(0xffbffffff),
                    ),
                    onPressed: () => showCustomModal(
                      listMenu(
                        context,
                        args.name!,
                        args.id!,
                      ),
                      context,
                      MediaQuery.of(context).size.height * 0.35,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: FutureListOfTask(
          id: args.id,
        ),
      ),
    );
  }
}
