import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/controllers/MenuController.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/localization_service.dart';
import 'package:get/get.dart';
import 'package:flutter_diablo2_exchange/responsive.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kDarkBlackColor, Colors.black87],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CustomMenuButton(
                itemList: LocalizationService.langs,
                onChanged: (value) {
                  LocalizationService().changeLocale(value);
                },
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),
                      InkWell(
                        onTap: () {
                          if(isDebug){
                            Get.toNamed('/sample');
                          }else{
                            _controller.setMenuIndex(0);
                          }
                        },
                        child: Image.asset(
                            'assets/icons/Diablo_II_Resurrected_Logo.png'),
                      ),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      // Socal
                      Socal(),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                  Text(
                    "welcome to the diablo2 exchange".tr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'kodia',
                    ),
                  ),
                  Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      height: 1.5,
                    ),
                  ),
                  // FittedBox(
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "Learn More",
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         SizedBox(width: kDefaultPadding / 2),
                  //         Icon(
                  //           Icons.arrow_forward,
                  //           color: Colors.white,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  if (Responsive.isDesktop(context))
                    SizedBox(height: kDefaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
