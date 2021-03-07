import 'package:flutter/material.dart';
import 'package:quipumarket/pages/home/Widgets.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/theme/Styles.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  int playDown = 1;
  bool visible = true;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //appBar: AppBarMarket(),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              
              final height = constraints.maxHeight;
              final width = constraints.maxWidth;

              /*return Container(
                width : constraints.maxWidth,
                height: constraints.maxHeight,
                padding: horizontalScaffoldPadding(context),
                child: Column(
                  children: <Widget> [
                    SizedBox(height: height * .04),
                    ProfileWidget(height: height, width: width),
                    SizedBox(height: height * .02),
                    ShopButton.blue(width: width, title: "Ver catálogo",),
                    SizedBox(height: height * .02,),
                    AboutMarketButtons(witdth: width,)
                    // BannerWidget(height: height*.35,),
                  ],
                ),
              );*/
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
            },
          ),
        ),
      ),
    );
  }
}

Widget row( double width) {
  return Row(
    children: [
      Container(
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
      ),
      Container(
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
      ),
      Container(
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
      ),
    ],
  );
}

class ShopGallery extends StatefulWidget {
  ShopGallery({this.width = 0});

  final double width;

  @override
  _ShopGalleryState createState() => _ShopGalleryState();
}

class _ShopGalleryState extends State<ShopGallery> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: widget.width,
            mainAxisExtent: widget.width,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(myProducts[index]["name"]),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(2)),
          );
        }),
    );
  }
}

final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();



