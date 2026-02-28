import 'package:get/get.dart';
import 'package:qunova/view/screens/contact_home/contact_home_screen.dart';
import 'package:qunova/view/screens/onboard/onboard_screen.dart';
import 'package:qunova/view/screens/splash/splash_screen.dart';

class AppRoute {

  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String contactHomeScreen = "/contact_home_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: onboardScreen, page: ()=> const OnboradScreen()),
    GetPage(name: contactHomeScreen, page: ()=> const ContactHomeScreen()),
  ];
}