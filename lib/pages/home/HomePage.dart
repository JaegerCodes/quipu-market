import 'package:flutter/material.dart';
import 'package:quipumarket/pages/home/Widgets.dart';
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
    
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              
              /*SliverAppBar(
                //pinned: true,
                floating: false,
                expandedHeight: 120.0,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Basic Slivers'),
                ),
              ),*/
              /*SliverFixedExtentList(
                itemExtent: 50,
                delegate: SliverChildListDelegate([
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                ]),
              ),*/
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return getMarketPresentationWidgets(width: width, height: height,)[index];
                  },
                  childCount: getMarketPresentationWidgets(width: width, height: height,).length,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _StickyTabBarDelegate(
                  TabBar(
                    controller: _controller,
                    tabs: <Widget>[
                      Tab(
                        text: "Novedades",
                      ),
                      Tab(
                        text: "Ofertas",
                      )
                    ],
                  ),
                )
              ),
              SliverFillRemaining(
                child: TabBarView(controller: _controller, children: <Widget> [
                  Container(
                    child: Wrap(
                      children: [
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        
                      ],
                    ),
                  ),
                  Container(
                    child: Wrap(
                      children: [
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                        containerDummy(width),
                      ],
                    ),
                  ),
              ])),
              
            ],
          ),
        ),
      )
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

    /**
   return SingleChildScrollView(
    child: Stack(
        children: <Widget>[
          Container(
            height: constraints.maxHeight,
            padding: horizontalScaffoldPadding(context),
            child: Column(
              children: <Widget> [
                SizedBox(height: height * .04),
                ProfileWidget(height: height, width: width),
                SizedBox(height: height * .02),
                ShopButton.blue(width: width, title: "Ver catálogo",),
                SizedBox(height: height * .03,),
                AboutMarketButtons(witdth: width,),
                SizedBox(height: height * .03,),
              ],
            ),
          ),
        ], 
      )
    );
   */
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
    return Container(child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
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




