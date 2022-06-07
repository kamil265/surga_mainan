import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DarkColor {
  static const Color primaryColor = Color(0xff2C96F1);
  static const Color secondaryColor = Color(0xff38ABBE);
  static const Color alertColor = Color(0xffED6363);
  static const Color priceColor = Color(0xff2C96F1);
  static const Color backgroundColor1 = Color(0xff181A1C);
  static const Color backgroundColor2 = Color(0xff21252A); 
  static const Color backgroundColor3 = Color(0xffECEDEF); 
  static const Color primaryTextColor = Color(0xffF1F0F2);
  static const Color secondaryTextColor = Color(0xff999999);
  static const Color subtitleColor = Color(0xff504F5E);
  static const Color transparentColor = Colors.transparent;
  static const Color blackColor = Color(0xff2E2E2E);
   static const Color iconColor = Color(0xffa8a09b);
  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);
}

class textStyle {
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

  static TextStyle primaryTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  static TextStyle secondaryTextStyle = GoogleFonts.montserrat(
    color: DarkColor.secondaryTextColor,
  );

  static TextStyle subtitleTextStyle = GoogleFonts.montserrat(
    color: DarkColor.subtitleColor,
  );

  static TextStyle priceTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );
  static TextStyle purpleTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  static TextStyle blackTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );

  static TextStyle alertTextStyle = GoogleFonts.montserrat(
    color: DarkColor.primaryTextColor,
  );
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
}
  
class gridValue{

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

}

 double defaultMargin = 30.0;