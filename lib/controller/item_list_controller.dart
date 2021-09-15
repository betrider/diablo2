import 'package:flutter_diablo2_exchange/index.dart';

class ItemListController extends GetxController {
  ItemListController({this.list = const [], this.isLoading = false});

  List<int> list;

  bool isLoading;

  int get count => list.length;

  void itemAdd() {
    this.list = [...this.list, ...List.generate(10, (v) => v)];
    print(this.list.length);
  }

  void updateLoading(bool loading) {
    isLoading = loading;
    update();
  }
}
