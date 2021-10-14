import 'package:flutter/material.dart';
import 'package:onlinebooks/app/constant/app_color.dart';

class HeaderText extends StatelessWidget {
  final double? fontSize;
  final bool isBold;
  final bool hasUnderline;
  final String text;
  final bool isCentered;
  final Color? textColor;
  final int maxline;

  const HeaderText(
    this.text, {
    Key? key,
    this.fontSize,
    this.isBold = true,
    this.hasUnderline = false,
    this.isCentered = false,
    this.textColor,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5!.copyWith(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          decoration: hasUnderline ? TextDecoration.underline : null,
          color: textColor ?? AppColors.black),
      textAlign: isCentered ? TextAlign.center : null,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
    );
  }
}
