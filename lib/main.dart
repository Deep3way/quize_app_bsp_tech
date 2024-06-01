import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/common/theme/app_fonts.dart';
import 'package:quize_app_bsp_tech/common/theme/app_theme.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';
import 'package:quize_app_bsp_tech/screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppFonts appFonts = AppFonts();
    return GetMaterialApp(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        theme: AppTheme.fromType(ThemeType.light).themeData,
        home: const SplashScreen(),
        title: appFonts.bspQuizeApp,
        getPages: appRoute.getPages,
        enableLog: true,
        debugShowCheckedModeBanner: false);
  }
}
