import 'package:flutter/material.dart';
import 'package:qunova/utils/color/app_color.dart';
import 'package:qunova/utils/image/app_images.dart';
import 'package:qunova/utils/strings/const_string.dart';

class OnboradScreen extends StatefulWidget {
  const OnboradScreen({super.key});

  @override
  State<OnboradScreen> createState() => _OnboradScreenState();
}

class _OnboradScreenState extends State<OnboradScreen> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white_100,
      body: Stack(
        children: [
          // 1. Animated Logo
          AnimatedAlign(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            alignment: _isAnimated ? const Alignment(0, -0.5) : Alignment.center,
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

          // 2. Animated Bottom Sheet
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            bottom: _isAnimated ? 0 : -size.height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.45,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ConstString.welcome,
                    style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    ConstString.lorem,
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white_100,
                        foregroundColor: AppColors.white_5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(ConstString.gettingStarted, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}