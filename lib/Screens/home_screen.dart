import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/logged_user_model.dart';
import 'package:erledigt/Model/user_screen_arguments.dart';
import 'package:erledigt/Screens/user_screen.dart';
import 'package:erledigt/Service/auth_service.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/list_of_lists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<AuthService>(context, listen: false).fetchSingleUser(),
      builder: (context, AsyncSnapshot<LoggedUser> snapshot) {
        if (snapshot.hasData) {
          LoggedUser user = snapshot.data!;

          return Scaffold(
            appBar: customAppBar(
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            UserScreen.routeName,
                            arguments: UserScreenArguments(user.email),
                          ),
                          child: CircleAvatar(
                            child: Text('${user.name![0].toUpperCase()}'),
                          ),
                        ),
                        Text(
                          "Home",
                          style: titleStyle,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xffbffffff),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/search'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: ListOfLists(),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height * 1,
          color: Color(0xffb591fff),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
