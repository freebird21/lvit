import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/infrastructure/common/image_constants.dart';
import 'package:lvit/infrastructure/common/string_constants.dart';
import 'package:lvit/infrastructure/providers/provider_registration.dart';

class TagView extends ConsumerStatefulWidget {
  const TagView({super.key});

  @override
  ConsumerState createState() => _TagViewState();
}

class _TagViewState extends ConsumerState<TagView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final homeProviderWatch = ref.watch(homeProvider);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: height / 9.99),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.blackColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcOver,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.0, 1.0],
                                  colors: [
                                    ColorConstants.mediumBlack,
                                    ColorConstants.blackColor.withOpacity(0.01),
                                  ],
                                ).createShader(bounds);
                              },
                              child: Image.asset(
                                ImageConstants.star,
                                height: 12,
                                color: ColorConstants.greyColor,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              StringConstants.starDigit,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: ColorConstants.lightWhite),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          StringConstants.title,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.whiteColor),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          StringConstants.digit,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.whiteColor),
                        ),
                      ],
                    ),
                    if (homeProviderWatch.currentCarouselPage == 1) ...[
                      const SizedBox(
                        width: 200,
                        child: Text(
                          StringConstants.subTitle,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: ColorConstants.whiteColor),
                        ),
                      )
                    ] else if (homeProviderWatch.currentCarouselPage.isEven &&
                        homeProviderWatch.currentCarouselPage != 0) ...[
                      Wrap(
                        direction: Axis.vertical,
                        children: List.generate(
                            homeProviderWatch.tagList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: index == 0
                                      ? ColorConstants.redLight.withOpacity(0.7)
                                      : ColorConstants.blackWithW300,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                      color: index == 0
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.secondaryColor,
                                      width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                child: Text(
                                  homeProviderWatch.tagList[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: index == 0
                                          ? ColorConstants.redDark
                                          : ColorConstants.mediumWhite),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ] else ...[
                      const Text(
                        StringConstants.digitTitle,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: ColorConstants.whiteColor),
                      )
                    ]
                  ],
                ),
                Image.asset(
                  ImageConstants.blueHeart,
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Image.asset(
                ImageConstants.downArrow,
                color: ColorConstants.whiteColor,
                height: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
