import 'package:flutter/material.dart';
import 'package:netflix_replica/pages/gmap_page.dart';
import 'package:netflix_replica/pages/home_page.dart';
import 'package:netflix_replica/pages/profiles__page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => HomePage(),
        'gmaps': (BuildContext context) => GmapsPage(),
      },
      theme: ThemeData(
        fontFamily: 'Netflix',
      ),
      home: ProfilesPage(),
    );
  }
}
