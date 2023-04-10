import 'package:flutter/material.dart';

class FoodDetailAppbar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExtentHeight;
  final Widget title;
  final ImageProvider backgroundImage;

  FoodDetailAppbar({
    required this.minExtentHeight,
    required this.expandedHeight,
    required this.title,
    required this.backgroundImage,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: title, // add the title widget
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant FoodDetailAppbar oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
    // title != oldDelegate.title;
    // backgroundImage != oldDelegate.backgroundImage;
  }
}