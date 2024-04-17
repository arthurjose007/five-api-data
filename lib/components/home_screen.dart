import 'package:flutter/material.dart';

class HomeScreenItems extends StatelessWidget {
  final IconData icon;
  final String data;
  const HomeScreenItems({super.key, required this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 26,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
