import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class modifiedtext extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  modifiedtext(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const boldText(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
