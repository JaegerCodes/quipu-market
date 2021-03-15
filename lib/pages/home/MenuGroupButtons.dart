import 'package:flutter/material.dart';
import 'package:quipumarket/models/MarketConfiguration.dart';
import 'package:quipumarket/pages/home/TopGroupButtons.dart';
import 'package:quipumarket/theme/Colors.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/widgets/Buttons.dart';

class MenuGroupButtons extends StatefulWidget {
  MenuGroupButtons();

  @override
  _MenuGroupButtonsState createState() => _MenuGroupButtonsState();
}

class _MenuGroupButtonsState extends State<MenuGroupButtons> {
  final MarketConfiguration marketConfiguration = dummyConfiguration;
  late Color colorTheme;
  late Color backgroundTheme;
  late double boxSideSize = 0;

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
    boxSideSize = ((MediaQuery.of(context).size.width)/3) - 7;
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardMenuRadius),
        ),
        child: Column(
          children: [
            _cardHeader(title: 'Powered by Quipu'),
            _groupButtons(),
          ],
        ),
      );
  }

  Widget _cardHeader({required String title}) {

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 6, right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(cardMenuRadius), topLeft: Radius.circular(cardMenuRadius)),
        color: backgroundTheme,
      ),
      child: Text(title, style: TextStyle(color: colorTheme, fontFamily: 'HKGrotesk'),),
    );
  }

  Widget _groupButtons() {
    return Container(
      margin: EdgeInsets.only(left: 4, top: 2, right: 4),
      width: double.infinity,
      child: Wrap(
        children: [
          _button(buttonRadius: BorderRadius.all(Radius.zero), text: 'Ofertas', icon: Icons.loyalty_sharp),
          _button(buttonRadius: BorderRadius.all(Radius.zero), text: 'Contacto', icon: Icons.phone),
          _button(buttonRadius: BorderRadius.all(Radius.zero), text: 'Delivery', icon: Icons.delivery_dining),

          _button(buttonRadius: BorderRadius.only(bottomLeft: Radius.circular(cardMenuRadius)), text: 'Ubícanos', icon: Icons.location_pin),
          _button(buttonRadius: BorderRadius.all(Radius.zero), text: 'Redes', icon: Icons.public),
          _button(buttonRadius: BorderRadius.only(bottomRight: Radius.circular(cardMenuRadius)), text: 'Canal', icon: Icons.tv),
        ],
      ),
    );
  }

  Widget _button({required BorderRadiusGeometry buttonRadius, required String text, required IconData icon}) {
    return Container(
      margin: EdgeInsets.all(2),
      height: boxSideSize, width: boxSideSize,
      child: CardMenuButton(
        buttonRadius: buttonRadius,
        icon: icon, text: text,
        onClick: (){},
      ),
    );
  }
}