import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';

class Socal extends StatelessWidget {
  const Socal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: kDefaultPadding),
        ElevatedButton(
          onPressed: () async{

            String domain = getGlobalConfig.get('domain');
            String clientId = getGlobalConfig.get('clientId');
            String redirectUri = getGlobalConfig.get('redirectUri');
            String responseType = getGlobalConfig.get('responseType');

            urlLauncher(url:'$domain?client_id=$clientId&redirect_uri=$redirectUri&response_type=$responseType', urlType: UrlType.INTERNET);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding,
            ),
          ),
          child: Text(
            "login".tr,
            style: TextStyle(fontFamily: 'kodia'),
          ),
        ),
      ],
    );
  }
}
