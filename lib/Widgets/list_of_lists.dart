import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Widgets/add_list_form.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/custom_rounded_button.dart';
import 'package:erledigt/Widgets/list_model_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfLists extends StatefulWidget {
  @override
  _ListOfListsState createState() => _ListOfListsState();
}

class _ListOfListsState extends State<ListOfLists> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: FutureBuilder(
        future: Provider.of<ListService>(context).fetchLists(),
        builder: (context, AsyncSnapshot<List<ListModel>> snapshot) {
          if (snapshot.hasData) {
            List<ListModel> lists = snapshot.data!;

            return Stack(
              children: [
                lists.length < 1
                    ? Center(
                        child: Text(
                          'Welcome, thank you for using Erledigt,\n please tap "+" to create a new list',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView(
                        children: lists
                            .map(
                              (ListModel list) => Container(
                                margin: EdgeInsets.only(bottom: 25.0),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    ListDetailScreen.routeName,
                                    arguments: ListDetailArguments(
                                      list.id,
                                      list.name,
                                    ),
                                  ).then((_) {
                                    setState(
                                      () {
                                        Provider.of<ListService>(context,
                                                listen: false)
                                            .fetchLists();
                                      },
                                    );
                                  }),
                                  child: listModelContainer(
                                    list,
                                    context,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                Positioned(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CustomRoundedButton(
                      child: addListForm(_controller, context),
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
