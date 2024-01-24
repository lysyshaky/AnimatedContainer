import 'package:animation_1/animations%20/3d_animation.dart';
import 'package:animation_1/animations%20/cirlce_animation.dart';
import 'package:flutter/material.dart';

import 'animations /3d_nav_animation.dart';
import 'animations /container_animation.dart';
import 'animations /custom_shape_animation.dart';
import 'animations /hero_image_animation.dart';
import 'animations /prompt_animation.dart';
import 'animations /tween_animation.dart';
import 'animations /zoom_image_animation.dart';
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
        '/heroImageAnimation': (context) => const HeroImageAnimation(),
        '/zoomImageAnimation': (context) => const ZoomAnimation(),
        '/tweenAnimation': (context) => const TweenAnimation(),
        '/customShapeAnimation': (context) => const CustomShapeAnimation(),
        '/3dNavAnimation': (context) => const Drawer3D(),
        '/promptAnimation': (context) => const AnimationCheck(),
      },
    );
  }
}
