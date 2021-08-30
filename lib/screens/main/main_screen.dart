import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/screens/exchange/exchange_screen.dart';
import 'package:flutter_diablo2_exchange/screens/freeBoard/free_board_screen.dart';
import 'package:flutter_diablo2_exchange/screens/freeSharing/free_sharing_screen.dart';
import 'package:flutter_diablo2_exchange/screens/itemDictionary/item_dictinary_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_diablo2_exchange/controllers/MenuController.dart';
import 'package:flutter_diablo2_exchange/screens/home/home_screen.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(
                child: GetBuilder<MenuController>(
                  builder: (controller) {
                    switch (controller.selectedIndex) {
                      case 0:
                        return HomeScreen();
                      case 1:
                        return FreeBoardScreen();
                      case 2:
                        return ExchangeScreen();
                      case 3:
                        return FreeSharingScreen();
                      case 4:
                        return ItemDictionaryScreen();
                      default:
                        return HomeScreen();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
