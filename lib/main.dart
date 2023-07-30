import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controller/photo_controller.dart';
import 'package:wallpaper/controller/random_controller.dart';
import 'package:wallpaper/model/random_model.dart';
import 'package:wallpaper/screen/home_screen.dart';
import 'package:wallpaper/style/size.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SC().config(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoController>(create:(_)=>PhotoController()),
        ChangeNotifierProvider<RandomController>(create:(_)=>RandomController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WallPaper Application',
        home: HomeScreen(),
      ),
    );
  }
}
