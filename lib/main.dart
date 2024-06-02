import 'package:estate_app/core/config/app_theme.dart';
import 'package:estate_app/core/di/app_binding.dart';
import 'package:estate_app/presentation/screens/home/pages/home_screen.dart';
import 'package:estate_app/presentation/screens/root/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'core/config/app_color.dart';
import 'core/utils/my_scroll_behaviour.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);



    SystemUiOverlayStyle dark =  SystemUiOverlayStyle(
      statusBarColor: AppColor.topHomeBg,
      systemNavigationBarColor:  Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,

      // statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(dark);

    return GetMaterialApp(
      title: 'Estate app',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyScrollBehavior(),
      theme: AppTheme.light,
      home: const RootScreen(),
      initialBinding: AppBinding(),
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: ResponsiveWrapper.builder(child, defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1100, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
        );
      },
    );
  }
}

