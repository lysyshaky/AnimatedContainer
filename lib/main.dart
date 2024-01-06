import 'package:animation_1/animations%20/3d_animation.dart';
import 'package:animation_1/animations%20/cirlce_animation.dart';
import 'package:flutter/material.dart';

import 'animations /container_animation.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/containerAnimation': (context) => const ContainerAnimation(),
        '/circleAnimation': (context) => const CircleAnimation(),
        '/3dAnimation': (context) => const Animation3D(),
      },
    );
  }
}
