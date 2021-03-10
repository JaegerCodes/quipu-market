import 'package:flutter/material.dart';

class AppBarMarket extends StatefulWidget with PreferredSizeWidget {

  AppBarMarket({
    this.showTitle  = true,
    this.title      = "QUIPU MARKET"
  }) : preferredSize = Size.fromHeight(2);

  final Size preferredSize;
  final showTitle;
  final title;

  @override
  _AppBarMarketState createState() => _AppBarMarketState();
}

class _AppBarMarketState extends State<AppBarMarket> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      textTheme: Theme.of(context).textTheme,

      /*leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),*/
      title: FittedBox(
        child: Row(
          children: [
            ClipRect(
              child: Image.asset(
                "assets/logo-white-1.png",
                width: kToolbarHeight,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            widget.showTitle
            ? Text(widget.title) : Text("")
          ],
        ),
      ),
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }
}
