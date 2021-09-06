import 'iterable/iterable_object.dart';
import 'dart:convert';

extension CustomMapSC<K, V> on Map<K, V> {
  /// Returns a new [Iterable<MapEntry<K,V>>] with all elements that satisfy the
  /// predicate [test].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.filter((e) => e.key == 'a').toMap(); // {'a': 1}
  /// ```
  Iterable<MapEntry<K, V>> filter(bool Function(MapEntry<K, V>) test) {
    return entries.filter(test);
  }

  /// Returns the number of entries that matches the [test].
  ///
  /// If [test] is not specified it will count every entry.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 13, 14, 15].count();             // 6
  /// [1, 2, 3, 13, 14, 15].count((n) => n > 9); // 3
  /// ```
  int count([bool Function(MapEntry<K, V> element)? test]) {
    return entries.count(test);
  }

  /// Converts this map into a JSON string.
  ///
  /// Use optional parameter [toEncodable] to convert types that are not a
  /// number, boolean, string, null, list or a map with string keys.
  ///
  /// See [jsonEncode].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.toJSON(); // '''{'a':1,'b':2}'''
  /// ```
  String toJSON({Object? Function(Object? nonEncodable)? toEncodable}) {
    return jsonEncode(this, toEncodable: toEncodable);
  }

  String getValueFromIndex<T>(int index) {
    MapEntry<String, dynamic> _map = this.entries.cast().toList()[index];
    return _map.value.toString();
  }

  String getKeyFromIndex(int index) {
    return this.keys.cast().toList()[index];
  }

  String getValueFromKey(String key) {
    dynamic _map = this.cast()[key];
    return _map.toString();
  }

  String getKeyFromValue(String value) {
    String _key = '';
    this.entries.forEach((element) {
      if (element.value.toString() == value) _key = element.key.toString();
    });
    return _key;
  }

  /// {"aaa,bbb":"test"} => {"aaa":"test","bbb":"test"}
  Map<String, String> splitDoubleKey() {

    Map<String,String> returnMap = {};

    this.forEach((key, value) {
      String keyString = key.toString();
      List<String> keys = keyString.split(',');
      
      keys.forEach((element) {
        returnMap.addAll({'$element':'$value'});
      });
    });

    return returnMap;
  }
}
