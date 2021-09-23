import 'package:flutter_diablo2_exchange/index.dart';

class ListItemModel {

  /// 게시판 아이디
  String boardId;

  /// 아이템 정보
  String itemImagePath;

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
    required this.dateTime,
    required this.battleTagId,
    required this.diabloId,
    required this.memo,
  });
}
