import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/query_list_of_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<List<Task>>? _tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: Color(0xFFBFFFFFF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      color: Color(0xFFBFFFFFF),
                    ),
                    onFieldSubmitted: (value) {
                      value = _controller.text;
                      setState(() {
                        _tasks =
                            Provider.of<TaskService>(context, listen: false)
                                .queryTasks(value);
                      });
                    },
                    textInputAction: TextInputAction.search,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search',
                      hintStyle: TextStyle(
                        color: Color(0xFFBFFFFFF),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFFBFFFFFF),
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.text = "";
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: _controller.text.isEmpty
            ? Container()
            : QueryListOfTask(
                tasks: _tasks,
              ),
      ),
    );
  }
}
