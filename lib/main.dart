import 'package:flutter/material.dart';

import './pages/home.dart';

const APP_NAME = 'Flutter Delayed Start';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppHome(appName: APP_NAME),
    );
  }
}
