import 'dart:ui';

class ListingModel {
  int id;
  String imageUrl;
  double imageOffset;
  Offset dragStartPosition;
  Offset startDragOffset;

  ListingModel(
      {required this.id,
      required this.imageUrl,
      required this.imageOffset,
      required this.dragStartPosition,
      required this.startDragOffset});
}
