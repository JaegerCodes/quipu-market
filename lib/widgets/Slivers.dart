import 'package:flutter/material.dart';
import 'package:quipumarket/theme/Colors.dart';

class StickyWidgetDelegate extends SliverPersistentHeaderDelegate {
  const StickyWidgetDelegate(this.widget, this.height);

  final Widget widget;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(child: widget);
  }

  @override
  bool shouldRebuild(StickyWidgetDelegate oldDelegate) {
    return widget != oldDelegate.widget;
  }
}


class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool darkModeOn = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.WHITE_900),
        color: darkModeOn? ColorTheme.WHITE_900 : ColorTheme.WHITE_50,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(1), topRight: Radius.circular(1)),
      ),
      child: tabBar
    );
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
