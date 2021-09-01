import 'dart:math';
import 'package:intl/intl.dart';

extension CustomNumberExtension on num? {

  /// 
  ///
  /// Example:
  /// ```dart
  /// 
  /// ```
  String bytesToString({int decimals = 2}) {
    if (this! <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(this!) / log(1024)).floor();
    return ((this! / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  /// 화폐단위로 변환
  ///
  /// Example:
  /// ```dart
  /// 123456789.toCurrency(); // '123,456,789'
  /// ```
  String toCurrency() {
    if (this == null) return "";
    return NumberFormat('###,###,###,###').format(this).replaceAll(' ', '');
  }
}