import 'package:flutter_diablo2_exchange/index.dart';

class UserController extends GetxController {
  String? loginId;
  String? phoneNumber;
  String? battleTagId;
  String? diabloId;

  UserController({
    this.loginId,
    this.phoneNumber,
    this.battleTagId,
    this.diabloId,
  });

  void signin() {
    loginId = storage.read('loginId');
    phoneNumber = storage.read('phoneNumber');
    battleTagId = storage.read('battleTagId');
    diabloId = storage.read('diabloId');

    update();
  }

  void signout() {

    //캐시제거
    storage.remove('loginId');
    storage.remove('phoneNumber');
    storage.remove('battleTagId');
    storage.remove('diabloId');

    loginId = storage.read('loginId');
    phoneNumber = storage.read('phoneNumber');
    battleTagId = storage.read('battleTagId');
    diabloId = storage.read('diabloId');

    update();
  }
}
