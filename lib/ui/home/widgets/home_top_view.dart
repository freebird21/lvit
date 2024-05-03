import 'package:flutter/material.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/infrastructure/common/image_constants.dart';
import 'package:lvit/infrastructure/common/string_constants.dart';

class HomeTopView extends StatelessWidget {
  const HomeTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.darkLocation,
                  height: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  StringConstants.locationHeading,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: ColorConstants.whiteColor),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.blackColor,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(
                          color: ColorConstants.lighterGray, width: 1)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.star,
                          height: 12,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          StringConstants.starDigit,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: ColorConstants.whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  ImageConstants.notification,
                  height: 34,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
