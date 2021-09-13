extension CustomBoolExtension on bool? {
  
  bool isTrue() {
    if (this == null) return false;
    return this!;
  }
}