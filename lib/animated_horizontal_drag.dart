import 'package:flutter/material.dart';

class AnimatedHorizontalDrag extends StatefulWidget {
  const AnimatedHorizontalDrag({super.key});

  @override
  State<AnimatedHorizontalDrag> createState() => _AnimatedHorizontalDragState();
}

class _AnimatedHorizontalDragState extends State<AnimatedHorizontalDrag> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Horizontal Draggable Container'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _left += details.delta.dx;
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            if (_left >= MediaQuery.of(context).size.width / 2) {
              _left = MediaQuery.of(context).size.width - 150.0;
            } else {
              _left = 0.0;
            }
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: _left,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Drag horizontal!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
