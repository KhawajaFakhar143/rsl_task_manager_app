import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_managing_app/bloc_state_observer.dart';
import 'package:task_managing_app/routes/app_router.dart';
import 'package:task_managing_app/routes/pages.dart';
import 'package:task_managing_app/tasks/data/data/local/data_sources/tasks_data_provider.dart';
import 'package:task_managing_app/tasks/data/repository/task_repository.dart';
import 'package:task_managing_app/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_managing_app/utils/color_palette.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateOberver();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    preferences: preferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) =>
            TaskRepository(taskDataProvider: TaskDataProvider(preferences)),
        child: BlocProvider(
            create: (context) => TasksBloc(context.read<TaskRepository>()),
            child: MaterialApp(
              title: 'RSL Task Manager',
              debugShowCheckedModeBanner: false,
              initialRoute: Pages.initial,
              onGenerateRoute: onGenerateRoute,
              theme: ThemeData(
                fontFamily: 'Sora',
                visualDensity: VisualDensity.adaptivePlatformDensity,
                canvasColor: Colors.transparent,
                colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
                useMaterial3: true,
              ),
            )));
  }
}
