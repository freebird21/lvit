import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/infrastructure/common/image_constants.dart';
import 'package:lvit/infrastructure/common/route_constants.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 2));
      navigateToUserListScreen();
    });
  }

  void navigateToUserListScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesConstants.dashboardScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstants.blackColor,
      child: Image.asset(
        ImageConstants.appLogo,
        height: double.infinity,
        fit: BoxFit.cover,
        width: double.maxFinite,
      ),
    );
  }
}
