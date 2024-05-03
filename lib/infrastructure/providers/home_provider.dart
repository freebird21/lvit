import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:lvit/infrastructure/common/string_constants.dart';
import 'package:lvit/infrastructure/models/image_model.dart';
import 'package:lvit/ui/common/toast_view.dart';

class HomeProvider extends ChangeNotifier {
  ScrollController controller = ScrollController();

  List<String> tagList = [
    StringConstants.tag1,
    StringConstants.tag2,
    StringConstants.tag3,
    StringConstants.tag4,
    StringConstants.tag5,
    StringConstants.tag6,
  ];

  List<ListingModel> images = [
    ListingModel(
        id: 1,
        imageUrl:
            "https://img.freepik.com/premium-photo/cute-girl-cartoon-hd-8k-wallpaper-stock-photographic-image_915071-29555.jpg",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
    ListingModel(
        id: 2,
        imageUrl:
            "https://c4.wallpaperflare.com/wallpaper/415/944/7/awesome-beautiful-cute-girl-wallpaper-preview.jpg",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
    ListingModel(
        id: 3,
        imageUrl:
            "https://img.lovepik.com/free-png/20210923/lovepik-cute-girl-avatar-png-image_401231841_wh1200.png",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
    ListingModel(
        id: 3,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7nzUBsECaKjjgCXlqaFDA_zYXR9E86grTIw&s",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
    ListingModel(
        id: 4,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV-jQrEYfGuNiN33c5YmFLFIJrkcG14H6soVpzk516qQ&s",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
    ListingModel(
        id: 4,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNHJV_CgSTeLqUCfv-X8I5rX0UrSTCITzV-6aJFoh-iw&s",
        imageOffset: 0,
        dragStartPosition: Offset.zero,
        startDragOffset: Offset.zero),
  ];

  final CarouselController carouselController = CarouselController();

  int get currentCarouselPage => _currentCarouselPage;
  int _currentCarouselPage = 0;

  void setCurrentCarouselPage({required int currentIndex}) {
    _currentCarouselPage = currentIndex;
    notifyListeners();
  }

  void removeOnDrag() {
    images.removeAt(_currentCarouselPage);
    notifyListeners();
  }

  void showPreviousImage() {
    if (_currentCarouselPage > 0) {
      _currentCarouselPage--;
      carouselController.animateToPage(_currentCarouselPage);
    }
    notifyListeners();
  }

  void showNextImage() {
    if (_currentCarouselPage < images.length - 1) {
      _currentCarouselPage++;
      carouselController.animateToPage(_currentCarouselPage);
    }
    notifyListeners();
  }

  void onVerticalDrag(DragUpdateDetails details, int index) {
    double dragDistance = details.globalPosition.dy -
        images[_currentCarouselPage].dragStartPosition.dy;

    images[_currentCarouselPage].imageOffset += dragDistance;
    images[_currentCarouselPage].dragStartPosition = details.globalPosition;

    notifyListeners();
  }

  void onVerticalDragStart(DragStartDetails details, int index) {
    images[_currentCarouselPage].dragStartPosition = details.globalPosition;
    notifyListeners();
  }

  void onVerticalDragEnd(DragEndDetails details, BuildContext context) {
    if (images.length > 1) {
      if (images[_currentCarouselPage].dragStartPosition.dy >=
          MediaQuery.of(context).size.height * 0.8) {
        images.removeAt(_currentCarouselPage);
        carouselController.animateToPage(_currentCarouselPage + 1);
        FlutterToast().showToast(
            context: context,
            msg: StringConstants.removeCardSuccessfully,
            isError: false);
      }
    } else {
      FlutterToast().showToast(
          context: context,
          msg: StringConstants.oneCardRequired,
          isError: true);
    }
    notifyListeners();
  }
}
