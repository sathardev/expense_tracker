import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final double? decorationThikness;
  final TextStyle? textStyle;

  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.align,
      this.maxLines,
      this.textDecoration,
      this.decorationColor,
      this.decorationThikness,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          GoogleFonts.nunitoSans(
            fontSize: size ?? 14,
            color: color ??
                (Theme.of(context).brightness == Brightness.light
                    ? darkColor
                    : whiteColor),
            fontWeight: weight,
            decoration: textDecoration,
            decorationColor: decorationColor ??
                (Theme.of(context).brightness == Brightness.light
                    ? darkColor
                    : whiteColor),
            decorationThickness: decorationThikness,
          ),
      // style: TextStyle(
      //   decorationThickness: decorationThikness ?? 2,
      //   decoration: textDecoration,
      //   decorationColor: decorationColor ??
      //       (Theme.of(context).brightness == Brightness.light
      //           ? darkColor
      //           : whiteColor),
      //   fontSize: size ?? 16,
      //   color: color ??
      //       (Theme.of(context).brightness == Brightness.light
      //           ? darkColor
      //           : whiteColor),
      //   fontWeight: weight,
      // ),
    );
  }
}
