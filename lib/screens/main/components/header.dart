import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/controllers/MenuController.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_diablo2_exchange/responsive.dart';

import '../../../constants.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
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
                      // SvgPicture.asset("assets/icons/Diablo_2_resurrected_logo.svg"),
                      Image.asset('assets/icons/Diablo_II_Resurrected_Logo.png'),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      // Socal
                      Socal(),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                  Text(
                    "디아블로2 레저렉션 거래소에 오신 걸 환영합니다.",
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
