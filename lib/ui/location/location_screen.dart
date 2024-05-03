import 'package:flutter/material.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlack,
      body: const SafeArea(
        child: Center(
          child: Text("스팟",style: TextStyle(color: ColorConstants.whiteColor),),
        ),
      ),
    );
  }
}
