
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({this.product});

  final Map? product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final imageHeigth = MediaQuery.of(context).size.height * 0.25;

    final product = widget.product?? { "id": "", "url": "", "title" : "" };
    
    return Container(
      padding: EdgeInsets.only(left: 4, top: 8, right: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Column(
          children: [
            FadeInImage(
              width: double.infinity,
              height: imageHeigth,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage( product["url"] ),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Container(width: double.infinity, child: Text(product["title"], maxLines: 2, textAlign: TextAlign.start,)),
            SizedBox(height: 2,),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: FittedBox(
                  fit: BoxFit.fitWidth, 
                  child: RichText(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: TextSpan(
                      text: 'S/200.00',
                      style: DefaultTextStyle.of(context).style.copyWith(color: Colors.blue),
                      children: <TextSpan> [
                        TextSpan(text: '  '),
                        TextSpan(text: 'S/320.00', style: DefaultTextStyle.of(context).style.copyWith(color: Colors.grey[400], decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                  ),
                ),
              ),
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


final List<Map> products = <Map> [
  //{ "id": "0", "url": "https://www.designscene.net/wp-content/uploads/2011/03/Rafael-Lazzini-for-ZARA-Man-February-2011-Lookbook-DesignSceneNet-07.jpg", "title" : "Casaca" },
  { "id": "1", "url": "https://i.pinimg.com/474x/08/36/e8/0836e866421bdb678f195e2d375f7129.jpg", "title" : "Traje rojo concha toro" },
  { "id": "2", "url": "https://i.pinimg.com/236x/c1/dd/30/c1dd30ec4a77394dcaa0fc702837f24f--zara-clothes-clothes-for-men.jpg", "title" : "Zara man agent" },
  { "id": "3", "url": "https://i.pinimg.com/originals/46/a3/38/46a33896e2d156c4cfba4c87e8283f78.jpg", "title" : "Camisa floread Zara Spring Collection" },
  { "id": "4", "url": "https://i.pinimg.com/originals/3f/12/2c/3f122c689c6cca621265a6ebbab8b13d.jpg", "title" : "Suéter Grey Zara man" },
  { "id": "5", "url": "https://dtpmhvbsmffsz.cloudfront.net/posts/2017/09/24/59c84636fbf6f915b8045163/m_59c8482199086a372a04566d.jpg", "title" : "Poshmark Zara men's slim fit floral printed shirt size L" },
  { "id": "6", "url": "https://i.pinimg.com/originals/49/df/0b/49df0be503196663a92db249950501dc.jpg", "title" : "Camisa Slim fit print" },
  { "id": "7", "url": "https://i.pinimg.com/originals/d5/69/75/d5697556d813fccc0d31e92c7542bda5.jpg", "title" : "Camisa floral slim fit" },
  { "id": "8", "url": "https://static-buyma-jp.akamaized.net/imgdata/item/201202/0062062465/309343313/428.jpg", "title" : "Camisa out neck Zara men's" },
  { "id": "9", "url": "https://i.pinimg.com/originals/c2/c7/df/c2c7df77babc1599a6991acbcc8bd02b.jpg", "title" : "Zara United States Collection" },
  { "id": "10", "url": "https://i.pinimg.com/originals/cb/4d/d0/cb4dd04a9627929f0cb687ab57d5eb55.jpg", "title" : "Zapatpos Negros Zara men's" },
];
class GridItemModel {
  String longtext;
  GlobalKey? itemKey;
  double width = 0;
  double height = 0;

  GridItemModel(this.longtext) {
    itemKey = GlobalKey();
  }
}