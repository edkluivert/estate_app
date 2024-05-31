import 'package:estate_app/presentation/screens/search/widgets/msg_clipper.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_color.dart';

class ChatBubble extends StatefulWidget {


  const ChatBubble({super.key,});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool isExpanded = false;
  double expandedWidth = 160;
  double collapsedWidth = 70;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? expandedWidth : collapsedWidth,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(10),

          ),
        ),
        child: Center(
          child: isExpanded ? Text(
            'Hello',
            style: const TextStyle(color: Colors.white),
          ): Icon(
            Icons.holiday_village,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
