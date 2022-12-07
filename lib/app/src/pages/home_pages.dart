// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedColor = Colors.black;
  double strokeWidth = 5.0;

  List<DrawingPoint> drawingPonts = [];
  List<Color> colors = [
    Colors.amber,
    Colors.amberAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.red,
    Colors.redAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.brown,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.grey,
    Colors.orange,
    Colors.orangeAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            drawingPonts.add(
              DrawingPoint(
                details.localPosition,
                Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanUpdate: (details) {
          setState(() {
            drawingPonts.add(
              DrawingPoint(
                details.localPosition,
                Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        // ignore: null_check_always_fails
        onPanEnd: (details) => setState(() => drawingPonts.add(null!)),
        child: CustomPaint(
          painter: _DrawingPainter(drawingPonts),
          child: SizedBox(
            height: size.height,
            width: size.width,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                colors.length,
                (index) => _buildColorChoose(colors[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorChoose(Color color) {
    bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        height: isSelected ? 55 : 40.0,
        width: isSelected ? 55 : 40.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  width: 3.0,
                )
              : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPonts;

  _DrawingPainter(this.drawingPonts);

  List<Offset> offsetList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPonts.length; i++) {
      if (drawingPonts[i] != null && drawingPonts[i + 1] != null) {
        canvas.drawLine(drawingPonts[i].offset, drawingPonts[i + 1].offset,
            drawingPonts[i].paint);
      } else if (drawingPonts[i] != null && drawingPonts[i + 1] == null) {
        offsetList.clear();
        offsetList.add(drawingPonts[i].offset);

        canvas.drawPoints(PointMode.points, offsetList, drawingPonts[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}
