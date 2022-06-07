import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surga_mainan/pages/shop_home/categories.dart';
import 'package:surga_mainan/pages/shop_home/home_page.dart';
import 'package:surga_mainan/pages/shop_home/order_page.dart';
import 'package:surga_mainan/pages/shop_home/products.dart';
import 'package:surga_mainan/pages/profile_page.dart';
import 'package:surga_mainan/pages/shop_home/tags.dart';
import 'package:surga_mainan/theme/dark_color.dart';
import 'package:surga_mainan/widgets/custom_bottom_bar.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(FontAwesomeIcons.home),
          title: Text('Home'),
          activeColor: DarkColor.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(FontAwesomeIcons.tags),
          title: Text(
            'Tags',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ) ,
            ),
          activeColor: DarkColor.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(FontAwesomeIcons.boxes),
          title: Text(
            'Categories',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ) ,
            ),
          activeColor: DarkColor.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(FontAwesomeIcons.box),
          title: Text(
            'Products',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ) ,
            ),
          activeColor: DarkColor.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(FontAwesomeIcons.cartShopping),
          title: Text(
            'Orders',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ) ,
            ),
          activeColor: DarkColor.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Tags(),
      Categories(),
      Products(),
      Orders(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }


}