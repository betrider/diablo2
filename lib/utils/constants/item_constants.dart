import 'package:flutter_diablo2_exchange/index.dart';

/// 아이템 종류
const itemType = [
  ...weapons,
  ...armors,
  ...otherItems,
  ...classWeapons,
  ...classArmors,
];

const weapons = [
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
  'Wands'
];

const classWeapons = [
  'Amazon Weapons',
  'Assassin Katars',
  'Sorceress Orbs',
];

const armors = [
  'Armor',
  'Belts',
  'Boots',
  'Circlets',
  'Gloves',
  'Helms',
  'Shields',
];

const classArmors = [
  'Barbarian Helms',
  'Druid Pelts',
  'Necromancer Shrunken Heads',
  'Paladin Shields',
];

const otherItems = [
  'Amulets',
  'Charms',
  'Jewels',
  'Rings',
];

/// 아이템 등급
const itemQuality = [
  'Unique',
  'Set',
  'Runewords',
  'Crafted',
  'Rare',
  'Magical',
  'Socketed Standard',
  'Standard'
];

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

/// 최상급 보석
const perfectGems = [
  'Perfect Ruby',
  'Perfect Sapphire',
  'Perfect Topaz',
  'Perfect Emerald',
  'Perfect Diamond',
  'Perfect Amethyst',
  'Perfect Skull',
];

/// 룬
const runes = [
  'El',
  'Eld',
  'Tir',
  'Nef',
  'Eth',
  'Ith',
  'Tal',
  'Ral',
  'Ort',
  'Thul',
  'Amn',
  'Sol',
  'Shael',
  'Dol',
  'Hel',
  'Io',
  'Lum',
  'Ko',
  'Fal',
  'Lem',
  'Pul',
  'Um',
  'Mal',
  'Ist',
  'Gul',
  'Vex',
  'Ohm',
  'Lo',
  'Sur',
  'Ber',
  'Jah',
  'Cham',
  'Zod',
];

/// 거래 재화(전부, 굴 룬, 보석)
const tradeItem = [
  'All',
  'Gul',
  ...perfectGems,
];