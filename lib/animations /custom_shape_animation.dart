import 'dart:math';

import 'package:flutter/material.dart';

class CustomShapeAnimation extends StatefulWidget {
  const CustomShapeAnimation({super.key});

  @override
  State<CustomShapeAnimation> createState() => _CustomShapeAnimationState();
}

class _CustomShapeAnimationState extends State<CustomShapeAnimation> with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sidesAnimation;

  late AnimationController _radiusController;
  late Animation<double> _radiusAnimation;

  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    _sidesController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _sidesAnimation = IntTween(begin: 3, end: 10).animate(_sidesController);

    _radiusController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _radiusAnimation = Tween<double>(begin: 20, end: 400)
        .chain(
          CurveTween(curve: Curves.bounceInOut),
        )
        .animate(_radiusController);

    _rotateController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 2 * pi)
        .chain(
          CurveTween(curve: Curves.easeInOut),
        )
        .animate(_rotateController);

    super.initState();
  }

  @override
  void dispose() {
    _sidesController.dispose();
    _radiusController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotateController.repeat(reverse: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Shape Animation'),
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
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _sidesController,
                _radiusController,
                _rotateController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_rotateAnimation.value)
                    ..rotateY(_rotateAnimation.value)
                    ..rotateZ(_rotateAnimation.value),
                  child: CustomPaint(
                    painter: Polygon(sides: _sidesAnimation.value),
                    child: SizedBox(
                      width: _radiusAnimation.value,
                      height: _radiusAnimation.value,
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;
    path.moveTo(
      center.dx + radius * cos(angles.first),
      center.dy + radius * sin(angles.first),
    );
    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
