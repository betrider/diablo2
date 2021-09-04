import 'package:flutter_diablo2_exchange/index.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

const _initCount = 20;

class SearchController extends GetxController {
  bool searchOnOff = false;
  int searchCount = _initCount;

  /// 검색 페이지 추가
  increaseIndex(int add) {
    if (searchOnOff) searchCount += add;
    update();
  }

  /// 페이지 검색 버튼 이벤트
  updateSearchOnoff() {
    searchOnOff = true;
    update();
  }

  /// 페이지 초기화
  clear() {
    searchCount = _initCount;
    searchOnOff = false;
  }
}
