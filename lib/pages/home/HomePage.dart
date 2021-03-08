import 'package:flutter/material.dart';
import 'package:quipumarket/pages/home/Widgets.dart';
import 'package:quipumarket/theme/Colors.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/theme/Styles.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          // SliverAppBar(title: Text("SomeTitle"), backgroundColor: Colors.black, pinned: true,),
          SliverList(
            delegate: SliverChildListDelegate( <Widget> [
              SizedBox(height: height * .02),
              ProfileWidget(height: height, width: width),
              SizedBox(height: height * .02),
              ShopButton.blue(width: width, title: "Ver catálogo",),
              SizedBox(height: height * .03,),
              Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: horizontalPaddingPercent * width),
                    child: StyledButton(title: 'Delivery', width: width/3 - 20,)
                  ),
                  Container(
                    margin: EdgeInsets.only(left: horizontalPaddingPercent * width, right: horizontalPaddingPercent * width),
                    child: StyledButton(title: 'Ubícanos', width: width/3 - 20,)
                  ) ,
                  Container(
                    margin: EdgeInsets.only(right: horizontalPaddingPercent * width),
                    child: StyledButton(title: 'Contacto', width: width/3 - 20,)
                  ),
                ],
              ),
              // AboutMarketButtons(witdth: width,),
              SizedBox(height: height * .03,),
            ])
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabBarDelegate(
              TabBar(
                // indicatorSize: TabBarIndicatorSize.label,
                controller: _controller,
                tabs: <Widget>[
                  Tab(
                    text: "Publicaciones",
                  ),
                  Tab(
                    text: "Descuentos",
                  )
                ],
              ),
          )),
          SliverPersistentHeader(
            pinned: false,
            delegate: _StickyWidgetDelegate(
              TabBarView(controller: _controller, children: <Widget> [
                GridGallery(width: width,),
                GridGallery(width: width,),
              ]),
              height
            )
          ),
        ]),
      ),
    );
  }
  List<Widget> getMarketPresentationWidgets({double width = 0, double height = 0}) {
    return [
      SizedBox(height: height * .04),
      ProfileWidget(height: height, width: width),
      SizedBox(height: height * .02),
      ShopButton.blue(width: width, title: "Ver catálogo",),
      SizedBox(height: height * .03,),
      AboutMarketButtons(witdth: width,),
      SizedBox(height: height * .03,),
    ];
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

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
    return Container(child: tabBar, color: ColorTheme.WHITE_900,);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

class _StickyWidgetDelegate extends SliverPersistentHeaderDelegate {
  const _StickyWidgetDelegate(this.widget, this.height);

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
  bool shouldRebuild(_StickyWidgetDelegate oldDelegate) {
    return widget != oldDelegate.widget;
  }
}

Widget containerDummy(double width){
  return Container(
    child: Container(
      width: width/3,
      height: width/3,
      child: Container(
        margin: EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1)
        ),
        child: Text("6"),
      )
    ),
  );
}

List<Widget> someTextWidgets() {
  List<Widget> output = [];
  for (var i = 0; i <= 100; i++) {
    output.add(Text(i.toString()));
  }
  return output;
}





