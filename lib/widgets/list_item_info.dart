import 'package:flutter_diablo2_exchange/index.dart';

class ListItemInfo extends StatelessWidget {
  const ListItemInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        color: Colors.black,
      ),
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: Colors.black,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ItemInfo(),
            ),
          ),
          Container(
            color: Colors.grey[850],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/icons/battlenet.png'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('배틀태그 : betrider#12345',
                          style: AppTextStyle.white_14_w400),
                    ],
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/icons/diablo2.png'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('아이디 : 베트라이더', style: AppTextStyle.white_14_w400),
                  ],
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  label: Text('메시지복사', style: AppTextStyle.white_14_w400),
                ),
              ],
            ),
          ),
          // Container(
          //   color: Colors.grey[700],
          //   child: Wrap(
          //     children: [
          //       Text(
          //         '125125125125125121251251251251251251251251251255125125125125125125125125125125125125125125125125125125',
          //         style: AppTextStyle.white_14_w400,
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
