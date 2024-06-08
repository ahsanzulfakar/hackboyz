import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackboys_app/homepage.dart';
import 'package:hackboys_app/pages/main_training.dart';
import 'package:hackboys_app/pages/projectsummary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/projectsummary',
          routes: {
            '/homepage': (context) => MainTraining(),
            '/maintraining': (context) => MainTraining(),
            '/mainhandover': (context) => MainTraining(),
            '/projectsummary': (context) => const ProjectSummary(),
          },
        ),
    );
  }
}
