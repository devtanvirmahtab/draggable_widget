import 'package:draggable_widget/animated_horizontal_drag.dart';
import 'package:draggable_widget/usingDragwidet.dart';
import 'package:draggable_widget/vertical_drag.dart';
import 'package:flutter/material.dart';

import 'horizontal_drag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _offset = Offset(100, 100);
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Container'),
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HorizontalDrag()),
                  );
                },
                child: const Text(" Horizontal Drag"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerticalDragUsingGesture()),
                  );
                },
                child: const Text("Vertical Drag"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HorizontalDragUsingDragWidget()),
                  );
                },
                child: const Text("Drag widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedHorizontalDrag()),
                  );
                },
                child: const Text("Animated Drag"),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: _offset.dx,
                  top: _offset.dy,
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        _dragging = true;
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _offset = Offset(
                          _offset.dx + details.delta.dx,
                          _offset.dy + details.delta.dy,
                        );
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _dragging = false;
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
                          'Drag me!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
