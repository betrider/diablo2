import 'package:flutter_diablo2_exchange/index.dart';

/// 아이템 종류
const itemType = [
  ...Armor, //갑옷
  ...Weapons, //무기
  ...OtherItems, //기타
];

const Armor = [
  'Helms',
  'Body Armor',
  'Shields',
  'Gloves',
  'Boots',
  'Belts',
  'Druid Pelts',
  'Barbarian Helms',
  'Paladin Shields',
  'Necromancer Shrunken Heads',
];

const Weapons = [
  'Axes',
  'Bows',
  'Crossbows',
  'Daggers',
  'Javelins',
  'Maces',
  'Polearms',
  'Scepters',
  'Spears',
  'Staves',
  'Swords',
  'Throwing Weapons',
  'Wands',
  'Amazon Weapons',
  'Assassin Katars',
  'Sorceress Orbs',
];

const OtherItems = [
  'Circlets',
  'Gem Type',
  'Rune',
  'Charm',
  'Jewel',
  'Amulet',
  'Ring',
];

/// 아이템 등급
enum ItemQuality {
  Unique,
  Set,
  Runewords,
  Crafted,
  Rare,
  Magical,
  SocketedStandard,
  Standard
}

/// 아이템 등급 리스트
List<String> get itemQualityList =>
    ItemQuality.values.map((e) => e.name).toList();

extension ItemQualityExtension on ItemQuality {
  String get name {
    switch (this) {
      case ItemQuality.Unique:
        return "Unique";
      case ItemQuality.Set:
        return "Set";
      case ItemQuality.Runewords:
        return "Runewords";
      case ItemQuality.Crafted:
        return "Crafted";
      case ItemQuality.Rare:
        return "Rare";
      case ItemQuality.Magical:
        return "Magical";
      case ItemQuality.SocketedStandard:
        return "Socketed Standard";
      case ItemQuality.Standard:
        return "Standard";
    }
  }
}

/// 아이템 등급별 색상
const itemQualityColor = [
  /// 유니크
  ItemColor.gold,

  /// 세트
  ItemColor.green,

  /// 유니크
  ItemColor.gold,

  /// 크래프트
  ItemColor.orange,

  /// 레어
  ItemColor.yellow,

  /// 매직
  ItemColor.blue,

  /// 소켓
  ItemColor.grey,

  /// 노말
  ItemColor.white
];

/// 거래 재화(룬, 보석)
const tradeItem = [
  'r25', //굴 룬
  'gpw', //최상급 다이아몬드
  'gpv', //최상급 자수정
  'gpb', //최상급 사파이어
  'gpy', //최상급 토파즈
  'gpr', //최상급 루비
  'skz', //최상급 스컬
  'gpg', //최상급 에메랄드
];
