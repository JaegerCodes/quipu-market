import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quipumarket/models/MarketConfiguration.dart';
import 'package:quipumarket/theme/Colors.dart';
import 'package:quipumarket/theme/Dimens.dart';

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

class CardMenuButton extends StatefulWidget {
  CardMenuButton({required this.buttonRadius, required this.icon, required this.text, required this.onClick, this.elevation = 20});

  final BorderRadiusGeometry buttonRadius;
  final IconData icon;
  final String text;
  final double elevation;
  final void Function() onClick;

  @override
  _CardMenuButtonState createState() => _CardMenuButtonState();
}

class _CardMenuButtonState extends State<CardMenuButton> {

  final MarketConfiguration marketConfiguration = dummyConfiguration;
  final Radius radiusCircular = Radius.circular(cardMenuRadius);
  late Color colorTheme;
  late Color backgroundTheme;

  @override
  void initState() {
    !marketConfiguration.isDark && marketConfiguration.background != 0xffffffff
    ? colorTheme = ColorTheme.WHITE_50
    : colorTheme = ColorTheme.WHITE_900;

    backgroundTheme = Color(marketConfiguration.background);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    return ElevatedButton(
        style: ButtonStyle(
          elevation:  MaterialStateProperty.resolveWith<double>((states) {
            if (states.contains(MaterialState.disabled)) {
              return 1;
            }
            if (!states.contains(MaterialState.pressed))
              return 0;
            
            return widget.elevation;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return backgroundTheme;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: widget.buttonRadius,
              //side: BorderSide(color: Colors.white)
            )
          )
        ),
        onPressed: widget.onClick,
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(icon: widget.icon),
              SizedBox(height: 10,),
              _text(text: widget.text)
            ],
          ),
        )
      );
  }

  Widget _text({required String text}) {
    return FittedBox(child: Text(text.toUpperCase(), style: TextStyle(color: colorTheme, fontWeight: FontWeight.w900, fontFamily: 'HKGrotesk'),));
  }

  Widget _icon({required IconData icon}) {
    return Icon(icon, color: colorTheme,);
  }
}



