import 'package:flutter/material.dart';
import 'package:surga_mainan/theme/dark_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    this.text,
    this.press,
    // ignore: non_constant_identifier_names
    this.margin_top,
  }) : super(key: key);
  final String text;
  // ignore: non_constant_identifier_names
  final double margin_top;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: margin_top),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          primary: Colors.white,
          backgroundColor: DarkColor.primaryColor,
        ),
        onPressed: press as void Function(),
        child: Text(
          text,
          style: textStyle.primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}