import 'package:flutter_diablo2_exchange/index.dart';

List<TextInputFormatter> idTextInputFormatter = [
  FilteringTextInputFormatter.allow(RegExp(RegExpId)),
];

List<TextInputFormatter> battleTagTextInputFormatter = [
  FilteringTextInputFormatter.allow(RegExp(RegExpBattleTag)),
];

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

///TextInputFormatter 관련 클래스
class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter();

  final List<String> phoneNumberList = [
    '010',
    '011',
    '012',
    '013',
    '014',
    '015',
    '016',
    '017',
    '018',
    '019'
  ]; //옛날번호

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var oldText = oldValue.text;
    var newText = newValue.text;

    //모든 번호 지운경우
    if (newText == ""){
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    var regExp = RegExp(r'^[\d-]+$'); //숫자 또는 하이펀 만 허용

    if (!regExp.hasMatch(newText)) {
      return TextEditingValue(
        text: oldText.toString(),
        selection: TextSelection.collapsed(offset: oldText.length),
      );
    }

    if (newText.length == 3) {
      if (!phoneNumberList.contains(newText)) {
        return TextEditingValue(
          text: oldText.toString(),
          selection: TextSelection.collapsed(offset: oldText.length),
        );
      }
    }

    //번호에 포함되어있는 하이펀을 지운경우
    if (oldText.length > newText.length) {
      if (newText.substring(newText.length - 1, newText.length) == '-') {
        newText = newText.substring(0, newText.length - 1);
      }
      return TextEditingValue(
        text: newText.toString(),
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    //조건부에 맞는 경우 자동 하이펀 추가
    if (newText.length >= 3 && phoneNumberList.contains(newText.substring(0, 3))) {
      //인터넷번호(010,070..)
      if (newText.length == 3 || newText.length == 8) newText = newText + "-";
      if (newText.length == 4 || newText.length == 9) {
        if (newText.substring(newText.length - 1, newText.length) != '-') {
          newText = newText.substring(0, newText.length - 1) +
              '-' +
              newText.substring(newText.length - 1, newText.length);
        }
      }
      if (newText.length > 13) newText = oldText;
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
