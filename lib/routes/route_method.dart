import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/screen/splash/quize_screens/quiz_screen.dart';
import 'package:quize_app_bsp_tech/screen/splash/quize_screens/result_screen.dart';
import 'package:quize_app_bsp_tech/screen/splash/splash_screen.dart';
import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  static String initial = _routeName.splashScreen;
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: _routeName.quizScreen, page: () =>  const QuizScreen()), 
    GetPage(name: _routeName.resultScreen, page: () =>    ResultScreen()), 
  ];
}
