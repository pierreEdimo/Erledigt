import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/list_model_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfLists extends StatelessWidget {
  const ListOfLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListService>(
      builder: (context, listService, child) {
        List<ListModel> lists = listService.getLists();
        return Container(
          child: lists.length < 1
              ? Center(
                  child: Text(
                    " Sorry there are no List yet\n" +
                        "please tap on '+' to create a new one",
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView(
                  children: lists
                      .map(
                        (ListModel list) => ListModelContainer(
                          list: list,
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }
}
