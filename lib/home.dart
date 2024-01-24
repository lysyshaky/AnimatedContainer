import 'package:animation_1/animations%20/3d_animation.dart';
import 'package:animation_1/animations%20/cirlce_animation.dart';
import 'package:animation_1/animations%20/custom_shape_animation.dart';
import 'package:animation_1/animations%20/hero_image_animation.dart';
import 'package:animation_1/animations%20/prompt_animation.dart';
import 'package:animation_1/animations%20/tween_animation.dart';
import 'package:animation_1/animations%20/zoom_image_animation.dart';
import 'package:flutter/material.dart';

import 'animations /3d_nav_animation.dart';
import 'animations /container_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const ContainerAnimation()));
              },
              child: const Text('Animation Container'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const CircleAnimation()));
              },
              child: const Text('Circle Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Animation3D()));
              },
              child: const Text('3D Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const HeroImageAnimation()));
              },
              child: const Text('Image Hero Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const ZoomAnimation()));
              },
              child: const Text('Zoom Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const TweenAnimation()));
              },
              child: const Text('Circle Color Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const CustomShapeAnimation()));
              },
              child: const Text('Circle Color Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Drawer3D()));
              },
              child: const Text('3D Drawer Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const AnimationCheck()));
              },
              child: const Text('Prompt Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
