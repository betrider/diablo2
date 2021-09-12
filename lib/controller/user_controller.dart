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

  void signin({
    required String loginId2,
    required String phoneNumber2,
    required String battleTagId2,
    required String diabloId2,
  }) {
    loginId = loginId2;
    phoneNumber = phoneNumber2;
    battleTagId = battleTagId2;
    diabloId = diabloId2;

    update();
  }

  void signout() {
    this.loginId = null;
    this.phoneNumber = null;
    this.battleTagId = null;
    this.diabloId = null;

    update();
  }
}
