import 'package:flutter/material.dart';

class HorizontalDragUsingDragWidget extends StatefulWidget {
  const HorizontalDragUsingDragWidget({super.key});

  @override
  State<HorizontalDragUsingDragWidget> createState() => _HorizontalDragUsingDragWidgetState();
}

class _HorizontalDragUsingDragWidgetState extends State<HorizontalDragUsingDragWidget> {
  double containerPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Draggable Container'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: containerPosition,
            child: Draggable(
              // childWhenDragging: Container(),
              feedback: Container(
                width: 150,
                height: 150,
                color: Colors.blue.withOpacity(0.5),
                child: const Center(
                  child: Text(
                    'Drag horizontally!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  containerPosition = offset.dx;
                });
              },
              axis: Axis.horizontal,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Drag horizontally!',
                    style: TextStyle(color: Colors.white),
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
