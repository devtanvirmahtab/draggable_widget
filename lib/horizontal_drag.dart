import 'package:flutter/material.dart';

class HorizontalDrag extends StatefulWidget {
  const HorizontalDrag({super.key});

  @override
  State<HorizontalDrag> createState() => _HorizontalDragState();
}

class _HorizontalDragState extends State<HorizontalDrag> {
  double _left = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: _left,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _left += details.primaryDelta!;
                  });
                },
                onHorizontalDragEnd: (details) {
                  setState(() {
                    // _left += details.primaryDelta!;
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
                      'Drag horizontally!',
                      style: TextStyle(color: Colors.white),
                    ),
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
