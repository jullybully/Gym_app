import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'pages/exercise.dart';
import 'pages/workout_page.dart';
import 'components/exercise_form.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/exercise.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseAdapter());
  await Hive.openBox<Exercise>('exercises');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
