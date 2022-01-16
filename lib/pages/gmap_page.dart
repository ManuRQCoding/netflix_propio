import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapsPage extends StatefulWidget {
  GmapsPage({Key? key}) : super(key: key);

  @override
  _GmapsPageState createState() => _GmapsPageState();
}

class _GmapsPageState extends State<GmapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
        backgroundColor: Colors.black,
        title: Text('Lozalización'),
      ),
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(zoom: 10, target: LatLng(37.8540800, -3.9329711))),
    );
  }
}
