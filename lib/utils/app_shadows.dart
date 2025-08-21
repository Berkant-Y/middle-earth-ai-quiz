import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow cardShadow = BoxShadow(
    color: Colors.black26,
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow buttonShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  static const BoxShadow textShadow = BoxShadow(
    color: Colors.black54,
    blurRadius: 2,
    offset: Offset(1, 1),
  );

  static const List<BoxShadow> containerShadow = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static const List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Colors.black38,
      blurRadius: 15,
      offset: Offset(0, 8),
    ),
  ];

  // Modal shadow for bottom sheets and dialogs
  static const List<BoxShadow> modalShadow = [
    BoxShadow(
      color: Colors.black54,
      blurRadius: 20,
      offset: Offset(0, -5),
      spreadRadius: 5,
    ),
  ];
}
