import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excellent_loading/flutter_excellentloading.dart';

void main() {
  runApp(const MyApp());

  ExcellentLoading.instance
    ..maskType = ExcellentLoadingMaskType.custom
    ..indicatorType = ExcellentLoadingIndicatorType.ios
    ..backgroundColor = Colors.white
    ..loadingStyle = ExcellentLoadingStyle.custom
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..boxShadow = []
    ..maskColor = Colors.white.withOpacity(0.1);
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Album> albums = [];

  Future<void> init() async {
    ExcellentLoading.show(
      status: 'សូមមេត្តារងចាំ',
    );
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/albums/');
    if (response.statusCode == 200) {
      for (var element in response.data) {
        Album album = Album.fromJson(element);
        albums.add(album);
      }
      setState(() {});
      ExcellentLoading.dismiss();
    }
    print(response);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterEasyLoading
    return Scaffold(
      body: ListView(
        children: [
          ...albums.map((e) => ListTile(
                title: Text(e.title),
                onTap: () async {
                  ExcellentLoading.show();
                  final response = await Dio().get('https://jsonplaceholder.typicode.com/albums/${e.id}');
                  if(response.statusCode == 200) {
                    ExcellentLoading.dismiss();
                    final Album album = Album.fromJson(response.data);
                   if(mounted) {
                     Navigator.push(context, CupertinoPageRoute(builder: (_) => Detail(album: album)));
                   }
                  }
                },
              ))
        ],
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final Album album;
  const Detail({super.key, required this.album});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        leading: Text(widget.album.id.toString(),),
        title: Text(widget.album.title,),
        trailing: Text('userId: ${widget.album.userId}'),
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
