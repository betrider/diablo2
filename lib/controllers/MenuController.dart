import 'package:flutter_diablo2_exchange/index.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MenuController extends GetxController {
  MenuController(int? index) {
    if (index != null) {
      _selectedIndex = index.obs;
    } else {
      _selectedIndex = 0.obs;
    }
  }
  late RxInt _selectedIndex;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems =>
      ["home", "exchange(standard)", "exchange(ladder)", "item dictionary"];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
    getCache.put('pageIndex', index);
    update();
  }
}
