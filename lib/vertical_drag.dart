import 'package:flutter/material.dart';

class VerticalDragUsingGesture extends StatefulWidget {
  const VerticalDragUsingGesture({super.key});

  @override
  State<VerticalDragUsingGesture> createState() => _VerticalDragUsingGestureState();
}

class _VerticalDragUsingGestureState extends State<VerticalDragUsingGesture> {
  double top = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: top,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      top += details.primaryDelta!;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Drag vertically!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
