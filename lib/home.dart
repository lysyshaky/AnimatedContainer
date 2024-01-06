import 'package:animation_1/animations%20/3d_animation.dart';
import 'package:animation_1/animations%20/cirlce_animation.dart';
import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
