import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizz/features/chat_bot/screens/chat_screen.dart';
import 'package:rizz/features/hidden_drawer/hidden_drawer.dart';
import 'package:rizz/test/image_generation.dart/test_screen.dart';
import 'package:rizz/test/summary/summary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ExampleCustomMenu(),
        );
      }
    );
  }
}

