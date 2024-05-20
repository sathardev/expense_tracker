import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/constants.dart';

class CustomInputFormField extends StatelessWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final FocusNode? nextfocusNode;
  final TextInputAction? textInputAction;
  final Function? ontap;
  final Function? onChanged;
  final Function? onEditingComplete;
  final Function? onFieldSubmitted;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputformatter;
  final TextEditingController? controller;
  final Color? color;
  final String? hintText;
  final double? size;
  final double? contentPadding;
  final bool? static;
  final double? inputsize;

  final bool? required;
  final int? maxLength;
  final int? maxLine;

  final bool? isPassword;
  final bool isEnable;
  final Color? fillColor;
  final Color? hintColor;
  final double? radius;
  final double? borderWidth;
  final double? verticalPadding;
  final bool? showBorder;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const CustomInputFormField({
    Key? key,
    this.autofocus,
    this.focusNode,
    this.textInputAction,
    this.ontap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textAlign,
    this.keyboardType,
    this.inputformatter,
    this.controller,
    this.color,
    this.hintText,
    this.static,
    this.size,
    this.inputsize,
    this.onChanged,
    this.required,
    this.maxLength,
    this.nextfocusNode,
    this.fillColor,
    this.isPassword,
    this.radius,
    this.maxLine,
    this.prefixIcon,
    this.isEnable = true,
    this.contentPadding,
    this.showBorder,
    this.borderWidth,
    this.verticalPadding,
    this.suffixIcon,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: isEnable ? true : false,
        maxLines: maxLine,
        maxLength: maxLength,
        readOnly: static ?? false,
        autofocus: autofocus != null && autofocus == true ? true : false,
        focusNode: focusNode,
        onTapOutside: (event) {
          FocusNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        // textInputAction: textInputAction,
        onTap: () {
          // if (!GetPlatform.isAndroid) {
          //   controller?.selection = TextSelection(
          //       baseOffset: 0, extentOffset: controller!.value.text.length);
          // }
          ontap != null ? ontap!() : () {};
        },
        obscureText: isPassword ?? false,

        // textDirection: textDirection,
        validator: (value) {
          if (required == null && (value == null || value == "") ||
              required == true && (value == null || value == "")) {
            return "This field can't be empty";
          } else {
            return null;
          }
        },
        cursorColor: Theme.of(context).brightness == Brightness.light
            ? darkColor
            : whiteColor,
        textAlign: textAlign ?? TextAlign.left,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputformatter ?? [],
        // inputFormatters: inputformatter != null
        //   ? [DecimalTextInputFormatter(), ...inputformatter!]
        //   : [DecimalTextInputFormatter()],
        onChanged: (String value) {
          if (onChanged != null && value != "") {
            onChanged!(value);
          }
        },
        onFieldSubmitted: (value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          }
        },
        onEditingComplete: () {
          if (onEditingComplete != null) {
            onEditingComplete!(focusNode, nextfocusNode);
            //onEditingComplete!();
          } else {
            FocusScope.of(context).nextFocus();
          }
        },
        controller: controller,

        // style: CommonInputStyle.commonTextStyle,
        style: TextStyle(
          color: Theme.of(Get.context!).brightness == Brightness.light
              ? primaryColor
              : whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            suffixIcon: suffixIcon ?? null,
            isDense: true,
            // hoverColor: (Theme.of(context).brightness == Brightness.light
            //     ? Theme.of(context).primaryColor.withOpacity(0.1)
            //     : const Color(0xFF303133)),
            hintFadeDuration: const Duration(milliseconds: 200),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 12,
                horizontal: contentPadding ?? 8),
            counterText: '',
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: hintColor ?? Color(0xFF3d3d5c),
                letterSpacing: 1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
              borderSide: BorderSide(
                  color: Color(0xFF3d3d5c), width: borderWidth ?? 0.5),
            ),
            filled: false,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
              borderSide: BorderSide(
                  color: Color(0xFF3d3d5c), width: borderWidth ?? 0.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
              borderSide: BorderSide(
                  color: Color(0xFF3d3d5c), width: borderWidth ?? 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
              borderSide: BorderSide(
                color: Color(0xFF3d3d5c),
                width: borderWidth ?? 0.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
              borderSide: BorderSide(
                color: orangeColor,
                width: borderWidth ?? 0.5,
              ),
            )));
  }
}
