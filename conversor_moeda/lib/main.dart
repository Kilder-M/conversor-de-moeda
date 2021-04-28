import 'package:conversor_moeda/app/views/HomePage.dart';
import 'package:flutter/material.dart';

import 'app/controllers/home_controller.dart';



void main() {
  runApp(AppWidget());
  print(HomeController().currencies[0].name);
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}