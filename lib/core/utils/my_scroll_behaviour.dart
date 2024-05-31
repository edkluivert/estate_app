import 'package:flutter/material.dart';


///To remove the glow effect when the user scrolls through the edges in the app

class MyScrollBehavior extends MaterialScrollBehavior  {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}