import 'package:flutter/material.dart';
import 'package:quipumarket/pages/home/Widgets.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/widgets/Buttons.dart';
import 'package:quipumarket/widgets/Slivers.dart';

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
            delegate: SliverChildListDelegate( getMarketPresentationWidgets(width: width, height: height) )
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              TabBar(
                // indicatorSize: TabBarIndicatorSize.label,
                controller: _controller,
                tabs: <Widget>[
                  Container(height: kTextTabBarHeight, child: Icon(Icons.grid_on)),
                  Container(height: kTextTabBarHeight, child: Icon(Icons.local_offer)),
                ],
              ),
          )),
          SliverPersistentHeader(
            pinned: false,
            delegate: StickyWidgetDelegate(
              tabViews(width: width),
              height
            )
          ),
        ]),
      ),
    );
  }
  
  List<Widget> getMarketPresentationWidgets({double width = 0, double height = 0}) {
    return [
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
    ];
  }

  Widget tabViews({double width = 0}) {
    return TabBarView(controller: _controller, children: <Widget> [
      GridPosts(width: width,),
      GridPosts(width: width,),
    ]);
  }
}






