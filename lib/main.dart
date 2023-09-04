import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home.dart';
import 'package:flutter_catalog/pages/login.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoutes: (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
      },

    );
  }
}


