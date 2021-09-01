extension CustomDynamicExtension on dynamic {
  /// enum 문자열변환 확장
  ///
  /// Example:
  /// ```dart
  /// TODAY.MONDAY.enumToString // 'MONDAY'
  /// ```
  String? enumToString() {
    return this == null ? null : this.toString().split('.').last;
  }
}
