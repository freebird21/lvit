import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lvit/infrastructure/providers/provider_registration.dart';

class ImageSliderView extends ConsumerStatefulWidget {
  const ImageSliderView({super.key});

  @override
  ConsumerState createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends ConsumerState<ImageSliderView> {
  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    return CarouselSlider.builder(
      itemCount: homeProviderWatch.images.length,
      carouselController: homeProviderWatch.carouselController,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 8, right: 8),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: ColorConstants.lighterBlack, width: 1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ShaderMask(
                blendMode: BlendMode.srcOver,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [
                      ColorConstants.transparentColor,
                      ColorConstants.blackColor,
                    ],
                  ).createShader(bounds);
                },
                child: GestureDetector(
                  onTapUp: (TapUpDetails details) {
                    if (details.globalPosition.dy <
                        MediaQuery.of(context).size.height / 2) {
                      if (details.globalPosition.dx <
                          MediaQuery.of(context).size.width / 2) {
                        homeProviderRead.showPreviousImage();
                      } else {
                        homeProviderRead.showNextImage();
                      }
                    }
                  },
                  onVerticalDragUpdate: (details) {
                    homeProviderRead.onVerticalDrag(details, index);
                  },
                  onVerticalDragEnd: (details) {
                    homeProviderRead.onVerticalDragEnd(details, context);
                  },
                  onVerticalDragStart: (details) {
                    homeProviderRead.onVerticalDragStart(details, index);
                  },
                  child: homeProviderWatch.currentCarouselPage >= 0
                      ? Stack(
                          children: [
                            Positioned.fill(
                              top: homeProviderWatch.images[index].imageOffset,
                              child: Image.network(
                                homeProviderWatch.images[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: false,
        height: double.maxFinite,
        viewportFraction: 0.92,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          homeProviderRead.setCurrentCarouselPage(currentIndex: index);
        },
      ),
    );
  }
}
