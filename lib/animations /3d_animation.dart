import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Animation3D extends StatefulWidget {
  const Animation3D({super.key});

  @override
  State<Animation3D> createState() => _Animation3DState();
}

class _Animation3DState extends State<Animation3D> with TickerProviderStateMixin {
  late AnimationController xController;
  late AnimationController yController;
  late AnimationController zController;
  late Tween<double> animation;

  @override
  void initState() {
    super.initState();
    xController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    yController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    zController = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    xController
      ..reset()
      ..repeat();

    yController
      ..reset()
      ..repeat();

    zController
      ..reset()
      ..repeat();

    const widthAndHeight = 100.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Animation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: widthAndHeight,
              ),
              AnimatedBuilder(
                animation: Listenable.merge([
                  xController,
                  yController,
                  zController,
                ]),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(animation.evaluate(xController))
                      ..rotateY(animation.evaluate(yController))
                      ..rotateZ(animation.evaluate(zController)),
                    child: Stack(
                      children: [
                        //back
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..translate(Vector3(0, 0, -widthAndHeight)),
                          child: Container(
                            color: Colors.purple,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        //front
                        Container(
                          color: Colors.green,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                        //left side
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()..rotateY(pi / 2),
                          child: Container(
                            color: Colors.red,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        //right side
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(-pi / 2),
                          child: Container(
                            color: Colors.blue,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        //top side
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()..rotateX(-pi / 2),
                          child: Container(
                            color: Colors.orange,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        //top side
                        Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateX(pi / 2),
                          child: Container(
                            color: Colors.tealAccent,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),

                        // Container(
                        //   color: Colors.red,
                        //   width: widthAndHeight,
                        //   height: widthAndHeight,
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
