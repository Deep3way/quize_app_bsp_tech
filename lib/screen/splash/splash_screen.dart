import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/common/theme/app_css.dart';
import 'package:quize_app_bsp_tech/common/theme/app_fonts.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () async {
      Get.toNamed(routeName.quizScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorName.black),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    AppFonts().bspQuizeApp,
                    style: AppCss.anyBodyExtraBold48White,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
