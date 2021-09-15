import 'package:flutter_diablo2_exchange/index.dart';

class ItemModel {

  /// 아이템등급
  ItemQuality itemQuality;

  /// 아이템명
  String name;

  /// 기본옵션정보(1.한손데미지,양손데미지,방어.. 2.내구도 3.착용 가능한 민첩성, 착용 가능한 힘, 착용 가능한 레벨)
  List<ItemPropertyModel> basicProperties;
  
  /// 부가옵션정보(모든 스킬 상승, 방어상승 ...)
  List<ItemPropertyModel> additionalProperties;

  ItemModel({
    required this.itemQuality,
    required this.name,
    required this.basicProperties,
    required this.additionalProperties
  });
}