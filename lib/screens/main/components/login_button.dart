import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';

class LoginButton extends StatefulWidget {

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) {
        return Row(
          children: [
            SizedBox(width: kDefaultPadding),
            controller.loginId == null
                ? ElevatedButton(
                    onPressed: () async {
                      Get.toNamed('/sign_in');

                      ///배틀넷 연결

                      // String domain = getGlobalConfig.get('domain');
                      // String clientId = getGlobalConfig.get('clientId');
                      // String redirectUri = getGlobalConfig.get('redirectUri');
                      // String responseType = getGlobalConfig.get('responseType');

                      // urlLauncher(url:'$domain?client_id=$clientId&redirect_uri=$redirectUri&response_type=$responseType', urlType: UrlType.INTERNET);
                    },
                    style: Responsive.isMobile(context) ? null : TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding
                      ),
                    ),
                    child: Text(
                      "login".tr,
                      style: TextStyle(fontFamily: 'kodia'),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      controller.signout();
                      showToast(message: '성공적으로 로그아웃되었습니다.');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding,
                      ),
                    ),
                    child: Text(
                      "logout".tr,
                      style: TextStyle(fontFamily: 'kodia'),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
