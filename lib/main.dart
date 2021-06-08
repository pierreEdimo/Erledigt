import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Screens/about_screen.dart';
import 'package:erledigt/Screens/edit_list_screen.dart';
import 'package:erledigt/Screens/edit_task_screen.dart';
import 'package:erledigt/Screens/home_screen.dart';
import 'package:erledigt/Screens/list_detail_screen.dart';
import 'package:erledigt/Screens/settings_screen.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Service/notification_service.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ListModelAdapter());

  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<ListModel>('lists');

  await Hive.openBox<Task>('tasks');

  NotificationService().init();

  runApp(MyApp());
}

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListService()),
        ChangeNotifierProvider(create: (context) => TaskService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: primaryBlack,
          fontFamily: 'MontSerrat',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/home': (context) => HomeScreen(),
          ListDetailScreen.routeName: (context) => ListDetailScreen(),
          EditTaskScreen.routeName: (context) => EditTaskScreen(),
          EditListScreen.routeName: (context) => EditListScreen(),
          '/about': (context) => AboutScreen(),
          '/settings': (context) => SettingScreen(),
        },
      ),
    );
  }
}
