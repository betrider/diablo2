import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF3B1D);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);

const kDefaultPadding = 20.0;
const kMaxWidth = 1232.0;
const kDefaultDuration = Duration(milliseconds: 250);

//diable item color(https://forums.d2jsp.org/topic.php?t=68614511&f=21)
// const itemCrystalBlue = Color(0xFFE7E7E7);
// const itemCrystalGreen = Color(0xFFE7E7E7);
// const itemCrystalRed = Color(0xFFE7E7E7);
// const itemDarkBlue = Color(0xFFE7E7E7);
// const itemDarkGold = Color(0xFFE7E7E7);
// const itemDarkGreen = Color(0xFFE7E7E7);
// const itemDarkRed = Color(0xFFE7E7E7);
// const itemDarkYellow = Color(0xFFE7E7E7);
// const itemLightBlue = Color(0xFFE7E7E7);
// const itemLightGold = Color(0xFFE7E7E7);
// const itemLightPurple = Color(0xFFE7E7E7);
// const itemLightRed = Color(0xFFE7E7E7);
// const itemLightYellow = Color(0xFFE7E7E7);
// const itemOrange = Color(0xFFE7E7E7);
// const itemWhite = Color(0xFFE7E7E7);

//참고:https://d2mods.info/forum/viewtopic.php?t=57429

class ItemColor {
  ItemColor._();

  static const white = Color.fromRGBO(255, 255, 255, 1); //일반아이템, 일반설명, 룬(1-9)
  static const red = Color.fromRGBO(255, 77, 77, 1); //착용불가, 에테리얼(설명), , 룬(23-33)
  static const green = Color.fromRGBO(0, 255, 0, 1); //세트아이템
  static const blue = Color.fromRGBO(105, 105, 255, 1); //매직아이템, 부가설명
  static const gold = Color.fromRGBO(199, 179, 119, 1); //유니크아이템, 룬워드, 룬(10-16)
  static const yellowGold = Color.fromRGBO(208, 194, 125, 1); //주얼
  static const grey = Color.fromRGBO(105, 105, 105, 1); //소켓아이템
  static const black = Color.fromRGBO(0, 0, 0, 1); //검정
  static const orange = Color.fromRGBO(255, 168, 0, 1); //소켓아이템(설명), 크래프트 아이템, 룬(17-22)
  static const yellow = Color.fromRGBO(255, 255, 100, 1); //레어아이템
}


