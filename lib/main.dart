import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/todo': (context) => Home(),
      },
    ));
