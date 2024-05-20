import 'package:flutter/material.dart';

import '../data/constants.dart';
import 'custom_text.dart';

class FormChildWithTitle extends StatelessWidget {
  const FormChildWithTitle({
    super.key,
    required this.title,
    required this.child,
    this.iconPadding,
    this.iconMargin,
    this.iconSize,
    this.icon,
    this.iconColor,
    this.bgColor,
    this.gap,
    this.isRequired,
  });

  final String title;
  final Widget child;
  final double? iconPadding;
  final double? iconMargin;
  final double? iconSize;
  final double? gap;
  final IconData? icon;
  final Color? iconColor;
  final Color? bgColor;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            icon != null
                ? Visibility(
                    child: Container(
                      padding: EdgeInsets.all(iconPadding ?? 12),
                      margin: EdgeInsets.all(iconMargin ?? 0),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: bgColor),
                      child: icon != null
                          ? Icon(
                              icon,
                              color: iconColor,
                              size: iconSize,
                            )
                          : null,
                    ),
                  )
                : Container(),
            SizedBox(
              width: gap,
            ),
            Row(
              children: [
                CustomText(
                  weight: FontWeight.w500,
                  size: 12,
                  text: title.isNotEmpty ? "$title:" : "",
                ),
                if (isRequired == true)
                  const Text(
                    "*",
                    style: TextStyle(color: orangeColor),
                  )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        child
      ],
    );
  }
}
