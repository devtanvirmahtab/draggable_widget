import 'package:flutter/material.dart';

class InsideListView extends StatefulWidget {
  const InsideListView({super.key});

  @override
  State<InsideListView> createState() => _InsideListViewState();
}

class _InsideListViewState extends State<InsideListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Draggable Container in ListView'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          if (index == 7) {
            return DraggableContainer();
          } else {
            return ListTile(
              title: Text('Item $index'),
            );
          }
        },
      ),
    );
  }
}

class DraggableContainer extends StatefulWidget {
  const DraggableContainer({super.key});

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  double _left = 0.0;
  bool _movedToLeft = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _left += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
            _left = 0.0;
            _movedToLeft = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(_left, 0, 0),
        width: 150,
        height: 150,
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Drag horizontal!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
