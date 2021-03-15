import 'package:flutter/material.dart';
import 'package:quipumarket/models/MarketConfiguration.dart';
import 'package:quipumarket/pages/home/MenuGroupButtons.dart';
import 'package:quipumarket/pages/home/TopGroupButtons.dart';
import 'package:quipumarket/theme/Colors.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MarketConfiguration marketConfiguration = dummyConfiguration;
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: marketConfiguration.isDark? ColorTheme.WHITE_900 : ColorTheme.WHITE_50,
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.home_outlined), color: ColorTheme.WHITE_900, onPressed: () {})
          ],
          backgroundColor: Color(marketConfiguration.background),
          title: Container(
            child: Image.asset(
              'assets/logo-quipu.jpg',
              fit: BoxFit.cover,
              height: kToolbarHeight,
            ),
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopGroupButtons(),
              SizedBox(height: 12,),
              MenuGroupButtons()
            ],
          ),
        )
      ),
    );
  }
  
}






