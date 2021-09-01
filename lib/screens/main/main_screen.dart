import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'package:flutter_diablo2_exchange/screens/exchange_radar/exchange_radar_screen.dart';
import 'package:flutter_diablo2_exchange/screens/exchange_standard/exchange_standard_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_diablo2_exchange/controllers/MenuController.dart';
import 'package:flutter_diablo2_exchange/screens/home/home_screen.dart';
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
              // constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(
                child: GetBuilder<MenuController>(
                  builder: (controller) {
                    switch (controller.selectedIndex) {
                      case 0:
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: kMaxWidth),
                          child: HomeScreen(),
                        );
                      case 1:
                        return ExchangeStandardScreen();
                      case 2:
                        return ExchangeRadarScreen();
                      default:
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: kMaxWidth),
                          child: HomeScreen(),
                        );
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
