import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Screens/edit_list_screen.dart';
import 'package:erledigt/Service/list_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListModelContainer extends StatefulWidget {
  final ListModel? list;
  const ListModelContainer({Key? key, this.list}) : super(key: key);

  @override
  _ListModelContainerState createState() => _ListModelContainerState();
}

class _ListModelContainerState extends State<ListModelContainer> {
  int? taskCount;

  fetchTaskCount(BuildContext context) {
    setState(() {
      taskCount = Provider.of<ListService>(context, listen: false)
          .getTaskCount(widget.list!);
    });
    return taskCount;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(
            EditListScreen.routeName,
            arguments: EditListArguments(widget.list),
          )
          .then(
            (_) => fetchTaskCount(context),
          ),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 25.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffafafafa),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.list!.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                fetchTaskCount(context) == 0
                    ? Text("")
                    : Text(
                        "$taskCount",
                      ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.list!.description!.isEmpty
                  ? "No Description added"
                  : widget.list!.description!,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
