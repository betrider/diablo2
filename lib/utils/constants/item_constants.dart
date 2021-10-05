import 'package:flutter_diablo2_exchange/index.dart';

/// 아이템 종류
const itemType = [
  'All',
  ...Armor, //갑옷
  ...Weapons, //무기
  ...Class, //클래스 전용
  ...OtherItems, //기타
];

const Armor = [
  'Helms',
  'Body Armor',
  'Shields',
  'Gloves',
  'Boots',
  'Belts',
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
];

const Class = [
  'Amazon Weapons',
  'Assassin Katars',
  'Sorceress Orbs',
  'Druid Pelts',
  'Barbarian Helms',
  'Paladin Shields',
  'Necromancer Shrunken Heads',
];

const OtherItems = [
  'Circlets',
  'Amulet',
  'Ring',
  'Charm',
  'Jewel',
  'Gem Type',
  'Rune',
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

/// 보석 타입
const gemType = [
  'gcv',
  'gfv',
  'gsv',
  'gzv',
  'gpv',
  'gcy',
  'gfy',
  'gsy',
  'gly',
  'gpy',
  'gcb',
  'gfb',
  'gsb',
  'glb',
  'gpb',
  'gcg',
  'gfg',
  'glg',
  'gsg',
  'gpg',
  'gcr',
  'gfr',
  'gsr',
  'glr',
  'gpr',
  'gcw',
  'gfw',
  'gsw',
  'glw',
  'gpw',
  'hp1',
  'hp2',
  'hp3',
  'hp4',
  'hp5',
  'mp1',
  'mp2',
  'mp3',
  'mp4',
  'mp5',
  'hrb',
  'skc',
  'skf',
  'sku',
  'skl',
  'skz',
];

///룬 타입
const runTeype = [
  'r01',
  'r02',
  'r03',
  'r04',
  'r05',
  'r06',
  'r07',
  'r08',
  'r09',
  'r10',
  'r11',
  'r12',
  'r13',
  'r14',
  'r15',
  'r16',
  'r17',
  'r18',
  'r19',
  'r20',
  'r21',
  'r22',
  'r23',
  'r24',
  'r25',
  'r26',
  'r27',
  'r28',
  'r29',
  'r30',
  'r31',
  'r32',
  'r33',
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
