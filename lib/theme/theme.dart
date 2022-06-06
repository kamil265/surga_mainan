import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surga_mainan/theme/dark_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      backgroundColor: DarkColor.backgroundColor1,
      primaryColor: DarkColor.primaryColor,
      cardTheme: CardTheme(color: DarkColor.backgroundColor2),
      textTheme: TextTheme(bodyText1: TextStyle(color: DarkColor.primaryTextColor)),
      iconTheme: IconThemeData(color: DarkColor.blackColor),
      bottomAppBarColor: DarkColor.backgroundColor2,
      dividerColor: DarkColor.transparentColor,
      primaryTextTheme:
          TextTheme(bodyText1: TextStyle(color: DarkColor.primaryTextColor)));

  static TextStyle titleStyle =
      const TextStyle(color: DarkColor.primaryTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: DarkColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  TextStyle primaryTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  TextStyle secondaryTextStyle = GoogleFonts.montserrat(
    color: DarkColor.secondaryTextColor,
  );

  TextStyle subtitleTextStyle = GoogleFonts.montserrat(
    color: DarkColor.subtitleColor,
  );

  TextStyle priceTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );
  TextStyle purpleTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  TextStyle blackTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  TextStyle alertTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  FontWeight light = FontWeight.w300;
  FontWeight regular = FontWeight.w400;
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;

}
