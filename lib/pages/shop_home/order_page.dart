import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:surga_mainan/theme/dark_color.dart';
import 'package:surga_mainan/theme/theme.dart';

class Orders extends StatefulWidget {
  const Orders({Key key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
          return Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shop',
                        style: textStyle.subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: textStyle.semiBold,
                        ),
                      ),
                      Text(
                        "Orders",
                        style: textStyle.primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //     user.profilePhotoUrl,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          );
    }

    Widget _icon(IconData icon, {Color color = DarkColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: DarkColor.backgroundColor2,
          ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

    Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DarkColor.backgroundColor2,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.white.withAlpha(60)),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.white.withAlpha(60))),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(FontAwesomeIcons.filter, color: Colors.white.withAlpha(60))
        ],
      ),
    );
  }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: DarkColor.primaryColor,
                ),
                child: Text(
                  'Semua',
                  style: textStyle.primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: textStyle.medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: DarkColor.subtitleColor,
                  ),
                  color: DarkColor.transparentColor,
                ),
                child: Text(
                  'PT Putra Terang Agung',
                  style: textStyle.subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: textStyle.medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: DarkColor.subtitleColor,
                  ),
                  color: DarkColor.transparentColor,
                ),
                child: Text(
                  'Terang Agung',
                  style: textStyle.subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: textStyle.medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget catProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Kategori Produk',
          style: textStyle.primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: textStyle.semiBold,
          ),
        ),
      );
    }

    // Widget catProducts() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 14,
    //     ),
    //     child: Column(
    //       children: [ProductCatList()]
    //     ),
    //   );
    // }
    return Container(
      color: DarkColor.backgroundColor1,
      child: ListView(
        children: [
          header(),
          SizedBox(height: 30,),
          _search(),
        ],
      ),
    );
  }
}