import 'dart:ui';

import 'package:estate_app/core/utils/assets_util.dart';
import 'package:flutter/material.dart';

class PlaceCard extends StatefulWidget {
  final String imageUrl;
  final String address;

  const PlaceCard({
    super.key,
    required this.imageUrl,
    required this.address,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> with TickerProviderStateMixin {
  late AnimationController _containerController;
  late Animation<double> _containerAnimation;

  double defaultContainerSize = 50;
  double targetContainerSize = 50; // Change this to a specific size

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  bool animationComplete = false;

  @override
  void initState() {
    super.initState();

    _containerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animationComplete = true;
        });
      }
    });

    _containerAnimation = Tween<double>(
      begin: defaultContainerSize,
      end: targetContainerSize,
    ).animate(CurvedAnimation(
      parent: _containerController,
      curve: Curves.fastOutSlowIn,
    ));

    _containerController.forward();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              widget.imageUrl.jpg,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 30,
            right: 30,
            child: AnimatedBuilder(
              animation: _containerAnimation,
              builder: (context, child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: _containerAnimation.value,
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (animationComplete)
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                widget.address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          SlideTransition(
                            position: _animation,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Transform.rotate(
                                    angle: -3.2,
                                    child: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
