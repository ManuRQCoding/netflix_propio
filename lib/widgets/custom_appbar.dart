import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black
          .withOpacity((scrollOffset / 350).clamp(0, 0.7).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset('assets/netflix_simple_logo.png'),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _appBarButton('Series TV', () => () {}),
                  _appBarButton('Películas', () => () {}),
                  _appBarButton('Categorías', () => () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _appBarButton(String title, Function onTap) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
