import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_replica/pages/home_page.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  List<Map<String, double>> imageSizes = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 5; i++) {
      imageSizes.add({
        "width": 100.0,
        "height": 100.0,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              _appBar(),
              SizedBox(
                height: 75,
              ),
              const Text(
                '¿Quién eres? Elige tu perfil',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    mainAxisSpacing: 17,

                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            imageSizes[index]['width'] = 90.0;
                            imageSizes[index]['height'] = 90.0;
                          });
                        },
                        onTapUp: (details) {
                          setState(() {
                            imageSizes[index]['width'] = 100.0;
                            imageSizes[index]['height'] = 100.0;
                            loading = true;
                          });

                          _cuentaAtras();

                          /*
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return LoadingPage();
                          }));*/
                        },
                        onTapCancel: () {
                          setState(() {
                            imageSizes[index]['width'] = 100.0;
                            imageSizes[index]['height'] = 100.0;
                          });
                        },
                        child: _perfilImage(index),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          if (loading)
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Center(child: CircularProgressIndicator(color: Colors.red)),
              ],
            ),
        ],
      ),
    );
  }

  Padding _perfilImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: imageSizes[index]['width'],
                height: imageSizes[index]['height'],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1258518578573250561/j7BqTLYc_400x400.jpg'),
                    )),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Text(
              'Pepe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack _appBar() {
    return Stack(
      children: [
        SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo-Netflix.png',
              width: 100,
            ),
          ],
        )),
        SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: IconButton(
                      splashRadius: 18,
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      )),
                )
              ]),
        ),
      ],
    );
  }

  _cuentaAtras() {
    var dur = Duration(seconds: 3);

    return Timer(dur, () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    });
  }
}
