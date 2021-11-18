import 'package:flutter/material.dart';

import 'modelos/home_page.dart';


void main() {
  runApp(AppMapsParcial());
}

class AppMapsParcial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fluter maps",
      home: HomePage(),
    );
  }
}
