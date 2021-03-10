import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quipumarket/theme/Colors.dart';
import 'package:quipumarket/theme/Dimens.dart';

class ShopButton extends StatefulWidget {

  ShopButton.blue({
    this.width = 0,
    this.title = "",
    this.background   = ColorTheme.BLUE_500,
    this.disableColor = ColorTheme.BLUE_100,
    this.lightColor   = ColorTheme.WHITE_50,
    this.darkColor    = ColorTheme.WHITE_50,
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
  const StyledButton({this.width = 0, this.title = "", this.background = Colors.white});

  final double width;
  final String title;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          hoverColor: ColorTheme.WHITE_100,
          highlightColor: ColorTheme.BLUE_50,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorTheme.WHITE_900),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            alignment: Alignment.center,
            width: width,
            child: FittedBox(child: Text(this.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),)),
            height: 45.0,
          ),
        ),
      );
  }
}

class BlurredButton extends StatefulWidget {
  BlurredButton({this.title = "", this.icon});

  final String title;
  final IconData? icon;

  @override
  _BlurredButtonState createState() => _BlurredButtonState();
}

class _BlurredButtonState extends State<BlurredButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: OutlinedButton.icon(
            label: Text(widget.title.toUpperCase(), style: TextStyle(color: ColorTheme.WHITE_50, fontSize: 10, fontWeight: FontWeight.w600), ),
            icon: Icon(widget.icon, color: ColorTheme.WHITE_50, size: 20,),
            onPressed: () {},
          )
        ),
      ),
    );
  }
}



