import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  var _color = getRandomColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Tween Animation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ClipPath(
            clipper: const CircleClipper(),
            child: TweenAnimationBuilder(
              tween: ColorTween(begin: getRandomColor(), end: _color),
              onEnd: () {
                setState(() {
                  _color = getRandomColor();
                });
              },
              duration: const Duration(seconds: 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Tween Animation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              builder: (context, color, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color as Color,
                    BlendMode.modulate,
                  ),
                  child: child!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() => Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    path.addOval(
      rect,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
