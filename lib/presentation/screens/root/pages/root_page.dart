import 'package:estate_app/presentation/screens/favourite/favourite_screen.dart';
import 'package:estate_app/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../chat/chat_screen.dart';
import '../../home/pages/home_screen.dart';
import '../../search/pages/search_screen.dart';
import 'package:estate_app/core/config/app_color.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  var containerSize = 0.0;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(5, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 1.5, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();

     setState(() {
       _controllers[_selectedIndex].forward();
       containerSize = 60;

     });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index != _selectedIndex) {
        _controllers[_selectedIndex].reverse();
        _controllers[index].forward();
        _selectedIndex = index;

       containerSize = 0;

       Future.delayed( const Duration(milliseconds: 700)).then((value){
         setState(() {
           containerSize = 60;
         });
       });
      }
    });
  }

  Widget _buildIcon(int index, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            // Ensuring opacity value is in valid range
            double opacityValue = 1.0 - _animations[index].value;
            if (opacityValue < 0.0) opacityValue = 0.0;
            if (opacityValue > 1.0) opacityValue = 1.0;
            return Stack(
              alignment: Alignment.center,
              children: [
               Opacity(
                  opacity: opacityValue,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: index == _selectedIndex ? containerSize : 60,
                    height: index == _selectedIndex ? containerSize : 60,
                    curve: Curves.easeIn,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _selectedIndex ? AppColor.secondaryColor : AppColor.accentColor
                    ),
                  ),
                ),
                Icon(
                  icon,
                  size: 30.0,
                  color: index == _selectedIndex ? Colors.white : Colors.grey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              SearchScreen(),
              ChatScreen(),
              HomeScreen(),
              FavouriteScreen(),
              ProfileScreen(),
            ],
          ),
          Positioned(
            bottom: 80.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.textColor,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIcon(0, Icons.search),
                  _buildIcon(1, Icons.message),
                  _buildIcon(2, Icons.search),
                  _buildIcon(3, Icons.favorite),
                  _buildIcon(4, Icons.person),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
