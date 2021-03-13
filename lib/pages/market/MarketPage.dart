import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quipumarket/pages/market/MarketItems.dart';
import 'package:quipumarket/theme/Colors.dart';
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
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Logo Zara
            SliverPersistentHeader(
              pinned: false,
              floating: false,
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
            // Buscar
            
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: StickyWidgetDelegate(
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 6, right: 8, top: 6),
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerLeft,
                      color: ColorTheme.WHITE_300,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(Icons.search_sharp, color: ColorTheme.WHITE_800,),
                          Expanded(child: Text('  ¿Qué buscamos hoy?', maxLines: 1, style: TextStyle(color: Colors.grey[800]),))
                        ],
                      ),
                    ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.2),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'),
                            image: NetworkImage("https://thefashionlaw.com/wp-content/uploads/2020/03/Zara-ad-campaign-3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
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
            /*SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemBuilder: (context, index) => ProductCard(product: products[index]),
              mainAxisSpacing: 8,
              staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.249),
              // staggeredTileBuilder: (index) => StaggeredTile.count((index % 7 == 0)? 2 : 1, (index % 7 == 0) ? 1.2 : 1.28),
              itemCount: products.length,
            ) // Instagram */
            
            /*SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemBuilder: (context, index) => SizedBox.expand(child: ProductCard(product: products[index]),),
              staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.3),
              itemCount: products.length,
            )*/
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemBuilder: (context, index) => ProductCard(product: products[index]),
              staggeredTileBuilder: (index) => StaggeredTile.extent(1, 230),
              itemCount: products.length,
            ),
          ],
        ),
      ),
    );
  }
}