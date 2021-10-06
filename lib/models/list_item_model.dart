import 'package:flutter_diablo2_exchange/index.dart';

enum DealStatus{
  /// 등록중
  REGISTERING,
  /// 등록완료
  REGISTERED,
  /// 거래완료
  COMPLETE
}

enum DealType{
  /// 구매
  BUY,
  /// 판매
  SELL
}

class ListItemModel {

  /// 게시판 아이디
  String boardId;

  /// 아이템 정보
  String itemImagePath;

  /// 거래 상태(등록중, 등록완료, 거래완료)
  DealStatus dealStatus;

  /// 거래 유형(팝니다, 삽니다)
  DealType dealType;

  /// 등록 시간
  String dateTime;
  
  /// 배틀태그 아이디
  String battleTagId;

  /// 디아블로 아이디
  String diabloId;

  /// 메모
  String memo;

  ListItemModel({
    required this.boardId,
    required this.itemImagePath,
    required this.dealStatus,
    required this.dealType,
    required this.dateTime,
    required this.battleTagId,
    required this.diabloId,
    required this.memo,
  });
}
