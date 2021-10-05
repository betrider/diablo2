import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/localization_service.dart';
import 'package:get/get.dart';
import 'package:flutter_diablo2_exchange/responsive.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'package:intl/intl.dart';
import 'login_button.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController(getCache.get('pageIndex')));

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
                  if (value == 'English') {
                    Intl.defaultLocale = 'en_US';
                  } else {
                    Intl.defaultLocale = 'ko_KR';
                  }
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (!Responsive.isMobile(context))
                        InkWell(
                          onTap: () {
                            if (isDebug) {
                              Get.toNamed('/sample');
                            } else {
                              _controller.setMenuIndex(0);
                            }
                          },
                          child: Image.asset(
                              'assets/icons/Diablo_II_Resurrected_Logo.png'),
                        ),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      // 로그인 버튼
                      LoginButton(),
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
                  SizedBox(height: kDefaultPadding),
                  Text(
                    "후원계좌 : 7979-37-48993(카카오뱅크)".tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'kodia',
                    ),
                  ),
                  // Text(
                  //   Get.find<UserController>().loginId ?? '노데이터',
                  //   style: TextStyle(
                  //     fontSize: 32,
                  //     color: Colors.white,
                  //     fontFamily: 'kodia',
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

// import 'package:flutter/material.dart';
// import 'package:flutter_diablo2_exchange/index.dart';
// import 'package:flutter_diablo2_exchange/localization_service.dart';
// import 'package:get/get.dart';
// import 'package:flutter_diablo2_exchange/responsive.dart';
// import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
// import 'package:intl/intl.dart';
// import 'login_button.dart';
// import 'web_menu.dart';
// import 'dart:ui' as ui;
// import 'dart:html' as html;
// import 'dart:html';

// class Header extends StatelessWidget {
//   Header() {
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
//       var iframe = html.IFrameElement();
//       iframe.src =
//           'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2827386973394827';
//       return iframe;
//     });
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory("add_script", (int viewId) {
//       ScriptElement element = ScriptElement()
//         ..async = true
//         ..src =
//             "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2827386973394827"
//         ..type = "text/javascript"
//         ..crossOrigin = "anonymous";
        
//       return element;
//     });
//   }

//   final MenuController _controller =
//       Get.put(MenuController(getCache.get('pageIndex')));

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [kDarkBlackColor, Colors.black87],
//         ),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: CustomMenuButton(
//                 itemList: LocalizationService.langs,
//                 onChanged: (value) {
//                   if (value == 'English') {
//                     Intl.defaultLocale = 'en_US';
//                   } else {
//                     Intl.defaultLocale = 'ko_KR';
//                   }
//                   LocalizationService().changeLocale(value);
//                 },
//               ),
//             ),
//             Container(
//               constraints: BoxConstraints(maxWidth: kMaxWidth),
//               padding: EdgeInsets.all(kDefaultPadding),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (!Responsive.isDesktop(context))
//                         IconButton(
//                           icon: Icon(
//                             Icons.menu,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             _controller.openOrCloseDrawer();
//                           },
//                         ),
//                       if (!Responsive.isMobile(context))
//                         InkWell(
//                           onTap: () {
//                             if (isDebug) {
//                               Get.toNamed('/sample');
//                             } else {
//                               _controller.setMenuIndex(0);
//                             }
//                           },
//                           child: Image.asset(
//                               'assets/icons/Diablo_II_Resurrected_Logo.png'),
//                         ),
//                       if (Responsive.isDesktop(context)) WebMenu(),
//                       // 로그인 버튼
//                       LoginButton(),
//                     ],
//                   ),
//                   SizedBox(height: kDefaultPadding),
//                   Text(
//                     "welcome to the diablo2 exchange".tr,
//                     style: TextStyle(
//                       fontSize: 32,
//                       color: Colors.white,
//                       fontFamily: 'kodia',
//                     ),
//                   ),
//                   // Text(
//                   //   Get.find<UserController>().loginId ?? '노데이터',
//                   //   style: TextStyle(
//                   //     fontSize: 32,
//                   //     color: Colors.white,
//                   //     fontFamily: 'kodia',
//                   //   ),
//                   // ),
//                   Container(
//                     width: 400,
//                     height: 300,
//                     child: HtmlElementView(viewType: 'iframe'),
//                   ),
//                   Container(
//                     width: 400,
//                     height: 300,
//                     child: HtmlElementView(viewType: 'add_script'),
//                   ),
//                   if (Responsive.isDesktop(context))
//                     SizedBox(height: kDefaultPadding),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
