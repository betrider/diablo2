import 'package:flutter_diablo2_exchange/index.dart';

class ItemModel {
  /// 아이템등급(유니크,세트 등등..)
  ItemQuality itemQuality;

  /// 아이템명(The Grandfather -> 번역)
  String index;

  /// 아이템 유형 코드(7gd -> 번역)
  String code;

  /// 기본옵션정보(1.한손데미지,양손데미지,방어.. 2.내구도 3.착용 가능한 민첩성, 착용 가능한 힘, 착용 가능한 레벨)
  List<ItemPropertyModel> basicProperties;

  /// 착용 가능한 민첩
  int? reqDex;

  /// 착용 가능한 힘
  int? reqStr;

  /// 착용 가능한 레벨
  int reqLevel;

  /// 무기계열(소드 계열, 오브 계열 등등..)
  String? desc;

  /// 부가옵션정보(모든 스킬 상승, 방어상승 ...)
  List<ItemPropertyModel> additionalProperties;

  ItemModel({
    required this.itemQuality,
    required this.index,
    required this.code,
    required this.basicProperties,
    this.reqDex,
    this.reqStr,
    required this.reqLevel,
    this.desc,
    required this.additionalProperties,
  });
}
