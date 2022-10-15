import 'package:excellent_loading/controller/exc_loading_controller.dart';
import 'package:excellent_loading/excellent_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());

  ExcellentLoading.instance
  ..color = Colors.green
  ..loadingType = LoadingType.inTop;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
             ExcellentLoading.show(
              context, 
              status: 'Please Wait',
              onDissmiss: () {
              print('object');
             });
            }, 
            child: Text('Show')
          )
        ),
    );
  }
}