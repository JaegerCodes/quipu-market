import 'package:flutter/material.dart';

class MarketGrid extends StatefulWidget {
  MarketGrid({this.height = 0, this.width = 0});

  final double height;
  final double width;

  @override
  _MarketGridState createState() => _MarketGridState();
}

class _MarketGridState extends State<MarketGrid> {
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.1,
      ),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            FadeInImage(
              width: widget.width/2,
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage( "https://www.designscene.net/wp-content/uploads/2011/03/Rafael-Lazzini-for-ZARA-Man-February-2011-Lookbook-DesignSceneNet-07.jpg" ),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Text("Casaca de cuero Zara man", maxLines: 2,),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    width: widget.width/4, child: FittedBox(
                      child: Text("S/200.00", maxLines: 1, textAlign: TextAlign.start, style: TextStyle(fontSize: 0.7, color: Colors.blue),))
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    width: widget.width/4, child: FittedBox(
                      child: Text("S/320.00", maxLines: 1, textAlign: TextAlign.start, style: TextStyle(fontSize: 0.7, color: Colors.grey[400], decoration: TextDecoration.lineThrough),),)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

final List<Map> myProducts =
      List.generate(3, (index) => {"id": index, "name": "Product $index"})
          .toList();