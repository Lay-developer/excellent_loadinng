
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excellent_loading/flutter_excellentloading.dart';

void main() {
  runApp(const MyApp());

  ExcellentLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = ExcellentLoadingIndicatorType.android
    ..loadingStyle = ExcellentLoadingStyle.custom
    ..radius = 15
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..boxShadow = []
    ..contentPadding = const EdgeInsets.all(20)
    ..textColor = Colors.black;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: ExcellentLoading.init(),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterEasyLoading
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                ExcellentLoading.show();
                Future.delayed(const Duration(seconds: 3), () {
                  ExcellentLoading.dismiss();
                });
              },
              child: const Text('Show'))),
      
    );
  }
}
