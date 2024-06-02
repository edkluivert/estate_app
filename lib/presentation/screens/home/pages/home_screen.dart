import 'package:estate_app/core/constants/app_constants.dart';
import 'package:estate_app/core/utils/assets_util.dart';
import 'package:estate_app/presentation/screens/home/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../../core/config/app_color.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late AnimationController _avatarController;
  late Animation<double> _avatarAnimation;

  late AnimationController _containerController;
  late Animation<double> _containerAnimation;

  bool animationComplete = false;

  late AnimationController _slideController;
  late Animation<Offset> _animationOffset;


  double defaultContainerSize = 30.0;
  double targetSize = 0.0;



  @override
  void initState() {

    super.initState();

  avatarAnimation();
  slideAnimation();
  containerAnimation();


  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slideController.dispose();
    _containerController.dispose();
    _avatarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColor.topHomeBg, AppColor.homeBg], // Adjust colors as needed
          )
        ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SlideTransition(
                          position: _animationOffset,
                          child: Container(
                            decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.pin_drop, color: Colors.grey[600],),
                                  const SizedBox(width: 5,),
                                  Text(
                                    'Saint Petersburg',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        AnimatedBuilder(
                          animation: _avatarAnimation,
                          builder: (context, child) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: AppColor.secondaryColor,
                                radius: _avatarAnimation.value,
                                backgroundImage: AssetImage(imAvatar.png),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Hi, Marina',
                      style: theme.displayMedium,
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width : size.width/1.5,
                      child: Text(
                        "let's select your perfect place",
                        style: theme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       AnimatedBuilder(
                         animation: _containerAnimation,
                         builder: (context, child) {
                           return Container(
                             width: _containerAnimation.value,
                             height: _containerAnimation.value,
                             decoration: BoxDecoration(
                                 color: AppColor.secondaryColor,
                                 shape: BoxShape.circle
                             ),
                             child: Visibility(
                               visible: animationComplete,
                               child: Column(
                                 children: [
                                   const SizedBox(height: 20,),

                                   Text('BUY', style : theme.headlineMedium!.copyWith(
                                     color: Colors.white
                                   )),
                                   SizedBox(height: size.height < 700 ? 20 : 30,),
                                   Countup(
                                       begin: 0,
                                       end: 1034,
                                       duration: const Duration(seconds: 3),
                                       separator: ',',
                                       style: theme.headlineLarge!.copyWith(
                                           color: Colors.white
                                       )
                                   ),
                                   const SizedBox(height: 10,),
                                   Text('offers', style : theme.headlineMedium!.copyWith(
                                       color: Colors.white
                                   )),
                                 ],
                               ),
                             ),
                           );
                         }
                       ),

                       AnimatedBuilder(
                         animation: _containerAnimation,
                         builder: (context, child) {
                           return Container(
                             width: _containerAnimation.value,
                             height: _containerAnimation.value,
                             decoration: BoxDecoration(
                                 color: AppColor.glassColor,
                                borderRadius: BorderRadius.circular(15)
                             ),
                             child: Visibility(
                               visible: animationComplete,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   const SizedBox(height: 20,),
                                       Text('RENT', style : theme.headlineMedium),
                                   SizedBox(height: size.height < 700 ? 20 : 30,),
                                   Countup(
                                       begin: 0,
                                       end: 2212,
                                       duration: const Duration(seconds: 3),
                                       separator: ',',
                                       style: theme.headlineLarge
                                   ),
                                   const SizedBox(height: 10,),
                                   Text('offers', style : theme.headlineMedium),
                                 ],
                               ),
                             ),
                           );
                         }
                       )
                     ],
                   ),
                    const SizedBox(height: 50,),
                  ],
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight : Radius.circular(30)
                  )
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const [
                    PlaceCard(
                      imageUrl: imKitchen,
                      address: 'Gladkova St., 25',
                    ),
                    PlaceCard(
                      imageUrl: imKitchen,
                      address: 'Trefoleva St., 43',
                    ),
                    PlaceCard(
                      imageUrl: imKitchen,
                      address: 'Trefoleva St., 43',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void slideAnimation(){
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationOffset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start off-screen to the left
      end: const Offset(0.0, 0.0), // End at the original position
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _slideController.forward();
  }


  void containerAnimation(){

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
      end: 160,
    ).animate(CurvedAnimation(
      parent: _containerController,
      curve: Curves.fastOutSlowIn,
    ));

    _containerController.forward();



  }

  void avatarAnimation(){
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _avatarAnimation = Tween<double>(
      begin: 0.0,
      end: 25.0,
    ).animate(CurvedAnimation(
      parent: _avatarController,
      curve: Curves.fastOutSlowIn,
    ));

    _avatarController.forward();
  }

}

