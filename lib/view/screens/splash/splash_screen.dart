import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qunova/core/route/app_route.dart';
import 'package:qunova/utils/color/app_color.dart';
import 'package:qunova/utils/image/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.onboardScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white_100,
      body: Stack(
        children: [

          /// Top Right Circle
          Positioned(
            top: -70,
            right: -70,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    200 * (1 - _controller.value),
                    -200 * (1 - _controller.value),
                  ),
                  child: child,
                );
              },
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),


          /// Bottom Left Circle
          Positioned(
            bottom: -150,
            left: -150,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    -250 * (1 - _controller.value),
                    250 * (1 - _controller.value),
                  ),
                  child: child,
                );
              },
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),


          /// Center Content with Animation
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.logo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}