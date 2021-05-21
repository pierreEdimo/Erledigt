import 'package:erledigt/Screens/about_screen.dart';
import 'package:erledigt/Screens/edit_list_screen.dart';
import 'package:erledigt/Screens/edit_task_screen.dart';
import 'package:erledigt/Screens/home_screen.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Screens/login_screen.dart';
import 'package:erledigt/Screens/logup_screen.dart';
import 'package:erledigt/Screens/search_screen.dart';
import 'package:erledigt/Screens/user_screen.dart';
import 'package:erledigt/Service/auth_service.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    String? token = await storage.read(key: "jwt");
    if (token == null) return "";
    return token;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ListService()),
        ChangeNotifierProvider(create: (context) => TaskService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffb591fff),
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
                future: jwtOrEmpty,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return snapshot.data == "" ? SignInScreen() : HomeScreen();
                },
              ),
          '/logup': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
          ListDetailScreen.routeName: (context) => ListDetailScreen(),
          '/search': (context) => SearchScreen(),
          EditTaskScreen.routeName: (context) => EditTaskScreen(),
          EditListScreen.routeName: (context) => EditListScreen(),
          UserScreen.routeName: (context) => UserScreen(),
          '/about': (context) => AboutScreen(),
        },
      ),
    );
  }
}
