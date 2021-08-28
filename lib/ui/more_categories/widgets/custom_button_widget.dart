import 'package:flutter/material.dart';
import 'package:tax_task/core/theme/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets margin;
  final double width;
  final double textSize;
  final double height;
  final BorderSide side;

  CustomButtonWidget({
    this.text = '',
    this.onTap,
    this.backgroundColor = clrPrimary,
    this.fontColor = clrWhite,
    this.width = double.infinity,
    this.textSize = 17,
    this.height = 48,
    this.margin = EdgeInsets.zero,
    this.side = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: side,
        ),
        onPressed: onTap,
        padding: EdgeInsets.all(0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: textSize,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
