import 'dart:math';

import 'package:flutter/services.dart';

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String separator = '-';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String separator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}

class DateTimeTextFormatter extends TextInputFormatter {
  static const _maxChars = 16;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String separator = '-';
    String timeSeparator = ':';
    String amPmSeparator = ' ';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
      timeSeparator,
      amPmSeparator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String separator,
    String timeSeparator,
    String amPmSeparator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    value = value.replaceAll(timeSeparator, '');
    value = value.replaceAll(amPmSeparator, '');

    final result = <String>[];
    var maxChars = value.length > _maxChars ? _maxChars : value.length;

    for (int i = 0; i < maxChars; i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
      if (i == 7 && i != value.length - 1) {
        result.add(' ');
      }
      if (i == 9 && i != value.length - 1) {
        result.add(timeSeparator);
      }
      if (i == 11 && i != value.length - 1) {
        if (value[i + 1] == "1") {
          result.add(" AM");
        } else if (value[i + 1] == "2") {
          result.add(" PM");
        }

        // print(value[i + 1]);
        // result.add(amPmSeparator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}

class TimeTextFormatter extends TextInputFormatter {
  static const _maxChars = 5;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String timeSeparator = ':';
    String amPmSeparator = ' ';
    var text = _format(
      newValue.text,
      oldValue.text,
      timeSeparator,
      amPmSeparator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String timeSeparator,
    String amPmSeparator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars;

    if (!isErasing && isComplete) {
      return oldValue;
    }
    value = value.replaceAll(timeSeparator, '');
    value = value.replaceAll(amPmSeparator, '');

    final result = <String>[];
    var maxChars = value.length > _maxChars ? _maxChars : value.length;

    for (int i = 0; i < maxChars; i++) {
      result.add(value[i]);

      if (i == 1 && i != value.length - 1) {
        result.add(timeSeparator);
      }
      // if (i == 11 && i != value.length - 1) {
      //   if (value[i + 1] == "1") {
      //     result.add(" AM");
      //   } else if (value[i + 1] == "2") {
      //     result.add(" PM");
      //   }

      //   // print(value[i + 1]);
      //   // result.add(amPmSeparator);
      // }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}
