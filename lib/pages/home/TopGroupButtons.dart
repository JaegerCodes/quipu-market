import 'package:flutter/material.dart';
import 'package:quipumarket/theme/Dimens.dart';
import 'package:quipumarket/widgets/Buttons.dart';

class TopGroupButtons extends StatefulWidget {
  TopGroupButtons();

  @override
  _TopGroupButtonsState createState() => _TopGroupButtonsState();
}

class _TopGroupButtonsState extends State<TopGroupButtons> {
  
  final Radius radiusCircular = Radius.circular(cardMenuRadius);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 0.2;

    return _stackCard(heigth: height);
  }

  Widget _stackCard({required double heigth}) {

    return Container(
      width: double.infinity,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: radiusCircular,
          bottomRight: radiusCircular,
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: radiusCircular, bottomRight: radiusCircular),
        child: Row(
          children: _buttonGroup(),
        ),
      ),
    );
  }

  List<Widget> _buttonGroup() {
    return [
      // loyalty
      Expanded(
        flex: 1,
        child: CardMenuButton(buttonRadius: BorderRadius.only(bottomLeft: radiusCircular), icon: Icons.shopping_bag_outlined, text: 'Tienda', onClick: (){
          Navigator.pushNamed(context, 'market').then((value) => setState((){}));
        },),
        /*child: Padding(
          padding: const EdgeInsets.only(right: 2),
          child: CardMenuButton(buttonRadius: BorderRadius.only(bottomLeft: radiusCircular), icon: Icons.shopping_bag_outlined, text: 'Tienda', onClick: (){},),
        )*/
      ),
      Expanded(
        flex: 1,
        child: CardMenuButton(buttonRadius: BorderRadius.circular(0), icon: Icons.payment, text: 'Pagar', onClick: (){}),
        /*child: Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: CardMenuButton(buttonRadius: BorderRadius.circular(0), icon: Icons.payment, text: 'Pagar', onClick: (){}),
        )*/
      ),
      Expanded(
        flex: 1,
        child: CardMenuButton(buttonRadius: BorderRadius.only(bottomRight: radiusCircular), icon: Icons.qr_code_scanner, text: 'Escanear', onClick: (){}
        /*child: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: CardMenuButton(buttonRadius: BorderRadius.only(bottomRight: radiusCircular), icon: Icons.qr_code_scanner, text: 'Escanear', onClick: (){}
        ),*/
      )),
    ];
  }

}

