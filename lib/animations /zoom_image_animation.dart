import 'package:flutter/material.dart';

class ZoomAnimation extends StatefulWidget {
  const ZoomAnimation({super.key});

  @override
  State<ZoomAnimation> createState() => _ZoomAnimationState();
}

const defaultWidth = 100.0;

class _ZoomAnimationState extends State<ZoomAnimation> {
  var _isZoomed = false;
  var _buttonText = 'Zoom In';
  var _width = defaultWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom Image Animation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: _width,
              child: Image.asset('assets/images/work.jpeg'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomed = !_isZoomed;
                  _buttonText = _isZoomed ? 'Zoom Out' : 'Zoom In';
                  _width = _isZoomed ? MediaQuery.of(context).size.width : defaultWidth;
                });
              },
              child: Text(_buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
