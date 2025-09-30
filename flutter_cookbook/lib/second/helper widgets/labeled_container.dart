import 'dart:core';

import 'package:flutter/material.dart';

class LabeledContainer extends StatelessWidget {
  final  width;
  final  height;
  final  color;
  final  text;
  final  textColor;
  const LabeledContainer({
    super.key,
     this.width,
     this.height,
     this.color,
     this.text,
     this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
      ),
    );
  }
}
