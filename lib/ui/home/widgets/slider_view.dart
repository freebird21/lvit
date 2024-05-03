import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/infrastructure/providers/provider_registration.dart';

class SliderView extends ConsumerStatefulWidget {
  const SliderView({super.key});

  @override
  ConsumerState createState() => _SliderViewState();
}

class _SliderViewState extends ConsumerState<SliderView> {
  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: SizedBox(
          height: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: homeProviderWatch.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => homeProviderWatch.carouselController
                    .animateToPage(entry.key),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      color: homeProviderWatch.currentCarouselPage == entry.key
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkGray,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
