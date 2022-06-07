import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surga_mainan/blocs/auth_bloc.dart';
import 'package:surga_mainan/services/auth_services.dart';
import 'package:surga_mainan/theme/dark_color.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
                        'Hallo,',
                        style: textStyle.primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: textStyle.semiBold,
                        ),
                      ),
                      Text(
                        "Email",
                        style: textStyle.subtitleTextStyle.copyWith(
                          fontSize: 16,
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
    return ListView(
      children: [
        header(),
        categories(),
        catProductsTitle(),
      ],
    );
  }
}