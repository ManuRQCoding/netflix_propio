import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_replica/pages/gmap_page.dart';
import 'package:netflix_replica/pages/home_page.dart';
import 'package:netflix_replica/pages/login_page.dart';
import 'package:netflix_replica/pages/profiles__page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => HomePage(),
        'gmaps': (BuildContext context) => GmapsPage(),
        'profiles': (BuildContext context) => ProfilesPage(),
      },
      theme: ThemeData(
        fontFamily: 'Netflix',
      ),
      home: LoginPage(),
    );
  }
}
