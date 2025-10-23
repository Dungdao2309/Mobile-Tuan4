import 'package:flutter/material.dart';

Widget buildDot({required bool isActive}) {
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: isActive ? Colors.blue : Colors.grey.shade500,
      shape: BoxShape.circle,
    ),
  );
}