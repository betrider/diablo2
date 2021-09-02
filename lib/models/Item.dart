///유니크 아이템 모델
class UniqueItemModel {
  UniqueItemModel({
    required this.reqLevel,
    this.reqStr,
    this.reqDex,
  });

  int reqLevel;
  int? reqStr;
  int? reqDex;
}

///세트 아이템 모델
class SetItemModel {
  SetItemModel({
    required this.reqLevel,
    this.reqStr,
    this.reqDex,
  });

  int reqLevel;
  int? reqStr;
  int? reqDex;
}

///크래프트 아이템 모델 3/1,2/2,1/3(4)
class CraftedItemModel {
  CraftedItemModel({
    required this.reqLevel,
    required this.reqStr,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length > 0),
        assert(prefixes.length > 0),
        assert(prefixes.length + suffixes.length <= 4);

  int reqLevel;
  int reqStr;
  List<String> prefixes;
  List<String> suffixes;
}

///레어 아이템 모델 3/3(6)
class RareItemModel {
  RareItemModel({
    required this.reqLevel,
    required this.reqStr,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length > 0),
        assert(prefixes.length <= 3),
        assert(prefixes.length > 0),
        assert(prefixes.length <= 3),
        assert(prefixes.length + suffixes.length <= 6);

  int reqLevel;
  int reqStr;
  List<String> prefixes;
  List<String> suffixes;
}

///레어 주얼 모델 3/1,2/2,1/3(4)
class RareJewelModel {
  RareJewelModel({
    required this.reqLevel,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length > 0),
        assert(prefixes.length > 0),
        assert(prefixes.length + suffixes.length <= 4);

  int reqLevel;
  List<String> prefixes;
  List<String> suffixes;
}

///매직 아이템 모델 1/1(2)
class MagicalItemModel {
  MagicalItemModel({
    required this.reqLevel,
    required this.reqStr,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length + suffixes.length > 0),
        assert(prefixes.length + suffixes.length <= 2);

  int reqLevel;
  int reqStr;
  List<String> prefixes;
  List<String> suffixes;
}

///매직 주얼 모델 1/1(2)
class MagicalJewelModel {
  MagicalJewelModel({
    required this.reqLevel,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length + suffixes.length > 0),
        assert(prefixes.length + suffixes.length <= 2);

  int reqLevel;
  List<String> prefixes;
  List<String> suffixes;
}

///매직 참 모델 1/1(2)
class MagicalCharmModel {
  MagicalCharmModel({
    required this.reqLevel,
    required this.prefixes,
    required this.suffixes,
  })  : assert(prefixes.length + suffixes.length > 0),
        assert(prefixes.length + suffixes.length <= 2);

  int reqLevel;
  List<String> prefixes;
  List<String> suffixes;
}

///소켓 아이템 모델
class SocketedStandardItemModel {
  SocketedStandardItemModel({
    required this.reqLevel,
    this.reqStr,
    this.reqDex,
    required this.sockets,
  }) : assert(sockets > 0 && sockets <= 6);

  int reqLevel;
  int? reqStr;
  int? reqDex;
  int sockets;
}

///노말 아이템 모델
class StandardItemModel {
  StandardItemModel({
    required this.reqLevel,
    this.reqStr,
    this.reqDex,
  });

  int reqLevel;
  int? reqStr;
  int? reqDex;
}
