import 'package:flutter/material.dart';

class OthersDraggable extends StatefulWidget {
  const OthersDraggable({super.key});

  @override
  OthersDraggableState createState() => OthersDraggableState();
}

class OthersDraggableState extends State<OthersDraggable> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  // _left = 0.0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(_left, 0, 0),
                color: Colors.blue,
                child: const Center(
                  child: Row(
                    children: [
                      Text(
                        'Drag horizontal!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}