import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffe3e0ff);

class TextWithPositionedWidget extends StatelessWidget {
  const TextWithPositionedWidget({
    super.key,
     this.top,
    this.bottom,
    this.left,
    this.right,
    this.height,
    this.width,
    this.text,
     this.fontSize, this.color, this.radians,
  });

  final  top;
  final bottom;
  final left;
  final right;
  final height;
  final width;
  final text;
  final  fontSize;
  final color;
  final radians;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(radians),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: TextStyle(fontSize: fontSize,color: Colors.white)),
      ),
    );
  }
}
