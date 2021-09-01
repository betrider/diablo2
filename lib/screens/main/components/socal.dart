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
        // if (!Responsive.isMobile(context))
        //   SvgPicture.asset("assets/icons/behance-alt.svg"),
        // if (!Responsive.isMobile(context))
        //   Padding(
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        //     child: SvgPicture.asset("assets/icons/feather_dribbble.svg"),
        //   ),
        // if (!Responsive.isMobile(context))
        //   SvgPicture.asset("assets/icons/feather_twitter.svg"),
        SizedBox(width: kDefaultPadding),
        ElevatedButton(
          onPressed: () async{
            var box = await Hive.openBox('cache');
            print(box.get('dave'));
            await box.put('dave', '1234');
            print(box.get('dave'));
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              // vertical: kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
              vertical: kDefaultPadding,
            ),
          ),
          child: Text(
            "로그인 하기",
            style: TextStyle(fontFamily: 'kodia'),
          ),
        ),
      ],
    );
  }
}
