import 'package:flutter/material.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlack,
      body: const SafeArea(
        child: Center(
          child: Text("마이",style: TextStyle(color: ColorConstants.whiteColor),),
        ),
      ),
    );
  }
}
