import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Carrinho de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        brightness: Brightness.light,
        backgroundColor: Color(0xffE5E5E5),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      initialRoute: '/home',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
