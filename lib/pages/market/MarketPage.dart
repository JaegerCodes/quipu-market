import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quipumarket/pages/market/MarketItems.dart';
import 'package:quipumarket/widgets/Buttons.dart';
import 'package:quipumarket/widgets/Slivers.dart';

class MarketPage extends StatefulWidget {
  MarketPage();

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Logo Zara
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: StickyWidgetDelegate(
                Container(
                  color: Colors.white,
                  height: 40,
                  child: Image.asset(
                    'assets/logo-zara.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                40
              )
            ),
            // Banner 20% DSCTO
            SliverAppBar(
              pinned: false,
              expandedHeight: height * .4,
              actionsIconTheme: IconThemeData(opacity: 0.0),
                flexibleSpace: Stack(
                  children: <Widget> [
                    Positioned.fill(
                      child: FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'),
                        image: NetworkImage("https://thefashionlaw.com/wp-content/uploads/2020/03/Zara-ad-campaign-3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Text(
                                '20% DSCT',
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)
                              )),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                'Descuentos se aplican en productos seleccionados',
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)
                              ),
                            )
                          ],
                        )
                    )),
                    Align(// margin: EdgeInsets.only(bottom: 10, right: 10),
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8, right: 8),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: BlurredButton(icon: Icons.shopping_bag, title: "Ver más",),
                      ),
                    ))
                  ],
                ),
            ),
            // Grid Galeria Ropa
            SliverStaggeredGrid.countBuilder(crossAxisCount: 2,
              itemBuilder: (context, index) => ProductCard(product: products[index]),
              staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.3),
              itemCount: products.length,
            )
            /*SliverStaggeredGrid.countBuilder(crossAxisCount: 2,
              itemBuilder: (context, index) => ProductCard(product: products[index]),
              staggeredTileBuilder: (index) => StaggeredTile.extent(1, 150 + (height*0.15)),
              itemCount: products.length,
            ),*/
          ],
        ),
      ),
    );
  }
}