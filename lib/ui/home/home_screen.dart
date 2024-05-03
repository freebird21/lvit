import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/ui/home/widgets/home_top_view.dart';
import 'package:lvit/ui/home/widgets/image_slider_view.dart';
import 'package:lvit/ui/home/widgets/slider_view.dart';

import 'widgets/tag_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlack,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HomeTopView(),
            Flexible(
                child: Stack(
              children: [ImageSliderView(), TagView(), SliderView()],
            ))
          ],
        ),
      ),
    );
  }
}
