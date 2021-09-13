import 'package:flutter_diablo2_exchange/index.dart';

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

///TextInputFormatter 관련 클래스
class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter();

  final List<String> areaNumberList = ['02','051','053','032','062','042','052','044','031','033','043','041','063','061','054','055','064']; //지역번호
  final List<String> oldNumberList = ['011','012','013','014','015','016','017','018','019']; //옛날번호
  final List<String> internetNumberList = ['010','070']; //인터넷
  final List<String> commericialNumberList = ['1588','1644']; //상업용

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var oldText = oldValue.text;
    var newText = newValue.text;

    //모든 번호 지운경우
    if (newText == "") {
      return TextEditingValue();
    }
    
    var regExp = RegExp(r'^[\d-]+$'); //숫자 또는 하이펀 만 허용

    if (!regExp.hasMatch(newText)) {
      return TextEditingValue(
        text: oldText.toString(),
        selection: TextSelection.collapsed(offset: oldText.length),
      );
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
    if (newText.length >= 2 && areaNumberList.contains(newText.substring(0, 2))) {
      //지역번호(02)
      if (newText.length == 2 || newText.length == 7) newText = newText + "-";
      if (newText.length == 3 || newText.length == 8) {
        if (newText.substring(newText.length - 1, newText.length) != '-') {
          newText = newText.substring(0, newText.length - 1) +
              '-' +
              newText.substring(newText.length - 1, newText.length);
        }
      }
      if (newText.length > 12) newText = oldText;
    } else if (newText.length >= 3 && areaNumberList.contains(newText.substring(0, 3))) {
      //지역번호(055,051..)
      if (newText.length == 3 || newText.length == 7) newText = newText + "-";
      if (newText.length == 4 || newText.length == 8) {
        if (newText.substring(newText.length - 1, newText.length) != '-') {
          newText = newText.substring(0, newText.length - 1) +
              '-' +
              newText.substring(newText.length - 1, newText.length);
        }
      }
      if (newText.length > 12) newText = oldText;
    }else if (newText.length >= 3 && oldNumberList.contains(newText.substring(0, 3))) {
      //옛날번호(011,012..)
      if (newText.length == 3 || newText.length == 7) newText = newText + "-";
      if (newText.length == 4 || newText.length == 8) {
        if (newText.substring(newText.length - 1, newText.length) != '-') {
          newText = newText.substring(0, newText.length - 1) +
              '-' +
              newText.substring(newText.length - 1, newText.length);
        }
      }
      if (newText.length > 12) newText = oldText;
    }else if (newText.length >= 3 && internetNumberList.contains(newText.substring(0, 3))) {
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
    } else if (newText.length >= 4 && commericialNumberList.contains(newText.substring(0, 4))) {
      //ex)상업용번호(1588,1644..)
      if (newText.length == 4) newText = newText + "-";
      if (newText.length == 5) {
        if (newText.substring(newText.length - 1, newText.length) != '-') {
          newText = newText.substring(0, newText.length - 1) +
              '-' +
              newText.substring(newText.length - 1, newText.length);
        }
      }
      if (newText.length > 9) newText = oldText;
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}