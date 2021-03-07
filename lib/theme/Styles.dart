
import 'package:flutter/material.dart';
import 'package:quipumarket/theme/Colors.dart';
import 'package:quipumarket/theme/Dimens.dart';

class ShopButton extends StatefulWidget {

  ShopButton.blue({
    this.width = 0,
    this.title = "",
    this.background = ColorTheme.BLUE_500,
    this.disableColor = ColorTheme.BLUE_100,
    this.lightColor = ColorTheme.WHITE_50,
    this.darkColor = ColorTheme.WHITE_50,
    this.withFittedBox = false,
  });

  final double width;
  final String title;
  final Color background;
  final Color disableColor;
  final Color lightColor;
  final Color darkColor;
  final bool withFittedBox;
 
  @override
  _ShopButtonState createState() => _ShopButtonState();
}

class _ShopButtonState extends State<ShopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horizontalScaffoldPadding(context),
      width: widget.width,
      child: widget.withFittedBox
      ? FittedBox(child: _getButtonContainer(),)
      : _getButtonContainer()
    );
  }

  ElevatedButton _getButtonContainer() {
    return ElevatedButton(
      style: _buttonStyle(),
      onPressed: () {},
      child: Text(widget.title.toUpperCase(), style: _textStyle()),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return widget.disableColor;
        }
        return widget.background;
    }));
  }

  TextStyle _textStyle() {
    
    bool darkModeOn = Theme.of(context).brightness == Brightness.dark;

    return TextStyle(
      color: darkModeOn? widget.darkColor : widget.lightColor
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({this.width = 0, this.title = ""});

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        shape: StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          hoverColor: ColorTheme.WHITE_100,
          highlightColor: ColorTheme.BLUE_50,
          child: FittedBox(
            child: Container(
              alignment: Alignment.center,
              width: width,
              child: Text(this.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
              height: 45.0,
            ),
          ),
        ),
      );
  }

  /**
   * 
   * child: InkWell(
      highlightColor: Colors.black,
      hoverColor: Colors.blue,
      child: Text("HEY", textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
      onTap: () {
        
      },
    ),
   */
}


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
