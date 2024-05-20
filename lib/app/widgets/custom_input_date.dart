import 'package:expense_tracker/app/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../data/constants.dart';
import '../helper/date_formater.dart';

class CustomInputDateFormField extends StatelessWidget {
  const CustomInputDateFormField({
    super.key,
    this.autofocus,
    this.focusNode,
    this.nextfocusNode,
    this.textInputAction,
    this.ontap,
    this.onChanged,
    this.onEditingComplete,
    this.textAlign,
    this.controller,
    this.color,
    this.hintText,
    this.size,
    this.static,
    this.inputsize,
    this.radius,
    this.required,
    this.fillColor,
    this.time = false,
    this.borderWidth,
  });
  final bool? autofocus;
  final FocusNode? focusNode;
  final FocusNode? nextfocusNode;
  final TextInputAction? textInputAction;
  final Function? ontap;
  final Function? onChanged;
  final Function? onEditingComplete;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final Color? color;
  final String? hintText;
  final double? size;
  final bool? static;
  final double? inputsize;
  final double? radius;
  final double? borderWidth;
  final bool? required;
  final Color? fillColor;
  final bool time;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            readOnly: static ?? false,
            autofocus: autofocus != null && autofocus == true ? true : false,
            focusNode: focusNode,
            // textInputAction: textInputAction,
            // onTap: () {
            //   controller?.selection = TextSelection(
            //       baseOffset: 0, extentOffset: controller!.value.text.length);
            //   ontap != null ? ontap!() : () {};
            // },

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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9-]")),
              DateTextFormatter()
            ],
            // inputFormatters: inputformatter != null
            //   ? [DecimalTextInputFormatter(), ...inputformatter!]
            //   : [DecimalTextInputFormatter()],
            onChanged: (String value) {
              if (onChanged != null && value != "") {
                onChanged!(value);
              }
            },
            onEditingComplete: () {
              if (onEditingComplete != null) {
                onEditingComplete!(focusNode, nextfocusNode);
                // onEditingComplete!();
              } else {
                FocusScope.of(context).nextFocus();
              }
            },
            controller: controller,
            style: TextStyle(
              color: color ??
                  (Theme.of(context).brightness == Brightness.light
                      ? darkColor
                      : whiteColor),
              fontSize: inputsize,
            ),
            decoration: InputDecoration(
                // suffixIcon: suffixIcon ?? null,
                isDense: true,
                // hoverColor: (Theme.of(context).brightness == Brightness.light
                //     ? Theme.of(context).primaryColor.withOpacity(0.1)
                //     : const Color(0xFF303133)),
                hintFadeDuration: const Duration(milliseconds: 200),
                // prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                // contentPadding: EdgeInsets.symmetric(
                //     vertical: verticalPadding ?? 12,
                //     horizontal: contentPadding ?? 8),
                counterText: '',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3d3d5c),
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
                ))),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: RoundedIconButton(
            padding: 10,
            icon: Iconsax.calendar_edit,
            color: Theme.of(context).primaryColor,
            bgColor: Colors.transparent,
            iconColor: Color(0xFF3d3d5c),
            onTap: () async {
              // ontap != null ? ontap!() : () {};
              if (time) {
                await pickDateTime(controller!);
              } else {
                DateTime? pickedDate = await pickDate();
                if (pickedDate != null) {
                  controller?.text =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                }
              }

              // if (pickedDate == null) return;
              // TimeOfDay? timer = await pickTime();
              // if (timer == null) return;
              //
              // if (pickedDate != null) {
              //   controller?.text =
              //       DateFormat('dd-MM-yyyy').format(pickedDate);
              // }
            },
          ),

          // InkWell(
          //   onTap: () {
          //     ontap != null ? ontap!() : () {};
          //   },
          //   child: const Icon(
          //     Iconsax.calendar,
          //     color: greyLightColor,
          //   ),
          // ),
        )
      ],
    );
  }
}

Future pickDateTime(TextEditingController controller) async {
  DateTime? pickedDate = await pickDate();
  if (pickedDate == null) return;

  TimeOfDay? time = await pickTime();
  if (time == null) return;

  final dateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
      time.hour, time.minute);
  controller?.text = DateFormat('dd/MM/yyyy hh:mma').format(dateTime);
}

Future<DateTime?> pickDate() async {
  DateTime? date = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2022, 1, 1),
      lastDate: DateTime.utc(2025, 3, 31));
  return date;
}

Future<TimeOfDay?> pickTime() async {
  Future<TimeOfDay?> time =
      showTimePicker(context: Get.context!, initialTime: TimeOfDay.now());
  return time;
}
