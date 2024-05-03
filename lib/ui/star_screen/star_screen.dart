import 'package:flutter/material.dart';

import '../../infrastructure/common/color_constants.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlack,
      body: const SafeArea(
        child: Center(
          child: Text("+",style: TextStyle(color: ColorConstants.whiteColor),),
        ),
      ),
    );
  }
}
