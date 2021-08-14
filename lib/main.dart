import 'package:asosiysi/models/asosiyPage.dart';
import 'package:asosiysi/models/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/homePage": (context) => HomePage(),
      },

      initialRoute: "/homePage",

      onGenerateRoute: (stngs) {
        List<String> pathElementlari = stngs.name.toString().split("/");
        if (pathElementlari[1] == "AsosiySahifa") {
          return MaterialPageRoute(
            settings: RouteSettings(name: stngs.name),
            builder: (context) {
              return AsosiyPage(int.parse(pathElementlari[2]));
            },
          );
        }
      },
    );
  }
}