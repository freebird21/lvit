import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';
import 'package:lvit/infrastructure/common/image_constants.dart';
import 'package:lvit/infrastructure/common/string_constants.dart';
import 'package:lvit/infrastructure/providers/provider_registration.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final dashboardProviderWatch = ref.watch(dashboardProvider);
    return Scaffold(
        backgroundColor: ColorConstants.lightBlack,
        body: dashboardProviderWatch.tabWidgets(),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.black,
          activeColor: ColorConstants.primaryColor,
          color: ColorConstants.secondaryColor,
          initialActiveIndex: 0,
          curveSize: 70,
          cornerRadius: 20,
          shadowColor: ColorConstants.lightGray,
          items: [
            TabItem(
                icon: Image.asset(
                  ImageConstants.home,
                  color: dashboardProviderWatch.selectedIndex == 0
                      ? ColorConstants.primaryColor
                      : ColorConstants.secondaryColor,
                ),
                title: StringConstants.home),
            TabItem(
                icon: Image.asset(
                  ImageConstants.location,
                  color: dashboardProviderWatch.selectedIndex == 1
                      ? ColorConstants.primaryColor
                      : ColorConstants.secondaryColor,
                ),
                title: StringConstants.location),
            TabItem(
                icon: Image.asset(
                  ImageConstants.starRound,
                ),
                title: ''),
            TabItem(
                icon: Image.asset(
                  ImageConstants.chat,
                  color: dashboardProviderWatch.selectedIndex == 3
                      ? ColorConstants.primaryColor
                      : ColorConstants.secondaryColor,
                ),
                title: StringConstants.chat),
            TabItem(
                icon: Image.asset(
                  ImageConstants.userSetting,
                  color: dashboardProviderWatch.selectedIndex == 4
                      ? ColorConstants.primaryColor
                      : ColorConstants.secondaryColor,
                ),
                title: StringConstants.userSetting),
          ],
          onTap: (int i) {
            ref.read(dashboardProvider).setSelectedIndex(index: i);
          },
        ));
  }
}
