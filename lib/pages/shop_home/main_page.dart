import 'package:flutter/material.dart';
import 'package:surga_mainan/pages/shop_home/categories.dart';
import 'package:surga_mainan/pages/shop_home/home_page.dart';
import 'package:surga_mainan/pages/shop_home/products.dart';
import 'package:surga_mainan/pages/shop_home/profile_page.dart';
import 'package:surga_mainan/theme/dark_color.dart';
import 'package:surga_mainan/theme/theme.dart';
import 'package:surga_mainan/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:surga_mainan/widgets/extentions.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isCategoriesSelected = true;
  
  Widget _icon(IconData icon, {Color color = DarkColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget onBottomIconPressed(int index) {
      switch (index) {
        case 0:
          return HomePage();
          break;
        case 1:
          return Product();
          break;
        case 2:
          return Categories() ;
          break;

        default:
          return HomePage();
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isCategoriesSelected
                            ? Categories()
                            : Align(
                                alignment: Alignment.topCenter,
                                child: ProfilePage(),
                              ),
                      ),
                    ),
                            ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
