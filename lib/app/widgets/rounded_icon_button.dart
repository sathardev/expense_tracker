import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final String? title;
  final String? toolTip;
  final Color? color;
  final Color bgColor;
  final Color? iconColor;
  final Color? focusColor;
  final double? size;
  final double? iconsize;
  final double? radius;
  final double? height;
  final double? width;
  final IconData icon;
  final FocusNode? focusNode;
  final Function onTap;
  final Function? onTap2;
  final double? padding;
  final double? margin;
  const RoundedIconButton(
      {Key? key,
      this.title,
      this.color,
      required this.bgColor,
      required this.iconColor,
      this.size,
      required this.onTap,
      this.focusNode,
      this.iconsize,
      this.onTap2,
      this.radius,
      this.padding,
      this.margin,
      this.focusColor,
      this.height,
      required this.icon,
      this.width,
      this.toolTip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: bgColor,
      // shape: CircleBorder(),
      borderRadius: BorderRadius.circular(50),
      color: Colors.transparent,
      child: Tooltip(
        message: toolTip ?? "",
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          splashColor: iconColor?.withOpacity(0.3),
          focusColor: focusColor ?? bgColor,
          focusNode: focusNode,
          borderRadius: BorderRadius.circular(50),
          // onLongPress: () {
          //   if (onTap2 != null) {
          //     onTap2!();
          //   }
          // },
          onTap: () {
            onTap();
          },
          child: Container(
            padding: EdgeInsets.all(padding ?? 8),
            margin: EdgeInsets.all(margin ?? 0),
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Icon(
              icon,
              color: iconColor,
              size: size ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
