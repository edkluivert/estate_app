import 'package:flutter/material.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 10, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 10);
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(size.width, size.height - 10, size.width - 10, size.height - 10);
    path.lineTo(20, size.height - 10);
    path.quadraticBezierTo(10, size.height - 10, 10, size.height);
    path.lineTo(0, size.height - 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}