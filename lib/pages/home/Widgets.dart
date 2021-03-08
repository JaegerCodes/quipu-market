import 'package:flutter/material.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/theme/Styles.dart';

class ProfileWidget extends StatefulWidget {
  
  ProfileWidget({this.width = 0, this.height = 0});

  final double width;
  final double height;

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalScaffoldPadding(context),
      child: Column(
        children: [
          Container(
            child: Row(
              children: <Widget>[
                _crearCircularImage(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Helados Laritza',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '#laritza_oficial',
                                  style: TextStyle(fontWeight: FontWeight.w800, color: Colors.blue[700]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            // padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pura creatividad en una fusión de sabores de helados y salsas cuidadosamente combinados para satisfacer cualquier paladar',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearCircularImage() {
    return Material(
      elevation: 0,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage('assets/logo-black-1.png'),
        child: Container(
        ),
        fit: BoxFit.cover,
        width: widget.width * 0.25,
        height: widget.width * 0.25,
      ),
    );
  }
}

class AboutMarketButtons extends StatefulWidget {
  
  AboutMarketButtons({this.witdth = 0});

  final double witdth;

  @override
  AboutMarketButtonsState createState() => AboutMarketButtonsState();
}

class AboutMarketButtonsState extends State<AboutMarketButtons> {
  
  
  @override
  Widget build(BuildContext context) {

    return _buildButtons();
  }

  Widget _buildButtons() {

    double buttonWidth = getWidgetWidth(widgetsPerRow: 3, width: widget.witdth);

    return Flexible(

      child: Container(
        margin: horizontalScaffoldPadding(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: StyledButton(width: buttonWidth, title: "Delivery",),
            )),
            Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: StyledButton(width: buttonWidth, title: "Ubícanos",),
            )),
            Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: StyledButton(width: buttonWidth, title: "Contacto",),
            ))
          ],
        ),
      ),
    );

  }
}


class BannerWidget extends StatefulWidget {

  BannerWidget({
    this.height = 0.0
  });

  final double height;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.all(10.0),
      child: ClipRRect( 
        borderRadius: BorderRadius.all(Radius.circular(7)),
        child: Stack(
          children: [
            Container( 
              height: widget.height,
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(
                  color: Colors.black87,
                ),
              ),
            ),
            Banner( 
              message: "30% desct!",
              // textStyle: Theme.of(context).bannerTheme.contentTextStyle,
              location: BannerLocation.bottomEnd,
              color: Colors.red,
              child: Container( 
                height: widget.height, 
              ),
            ),
          ],
        )
      ),
    );
  }
}

class GridGallery extends StatefulWidget {
  GridGallery({this.width = 0});

  final double width;

  @override
  _GridGalleryState createState() => _GridGalleryState();
}

class _GridGalleryState extends State<GridGallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: widget.width/3,
          mainAxisExtent: widget.width/3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            width: widget.width/3,
            height: widget.width/3,
            alignment: Alignment.center,
            child: Text(myProducts[index]["name"]),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(1)
            ),
          );
        }),
    );
  }
}

final List<Map> myProducts =
      List.generate(200, (index) => {"id": index, "name": "Product $index"})
          .toList();