import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Widgets/add_list_form.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/list_of_created_lists.dart';
import 'package:erledigt/Widgets/show_modal.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Container(
          color: Color(0xffbffffff),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: titleStyle,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/settings'),
                  child: Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: ListOfLists(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCustomModal(
          addListForm(context),
          context,
        ),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
