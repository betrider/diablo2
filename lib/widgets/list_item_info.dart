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
            child: Responsive.isMobile(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.timelapse_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            '등록시간 : ${DateTime.now().toFullDateTimeString5()}',
                            style: AppTextStyle.white_14_w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.message),
                          label:
                              Text('메시지복사', style: AppTextStyle.white_14_w400),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Align(
                        alignment: Alignment.center,
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
                        height: 4,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
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
                            Text('아이디 : 베트라이더',
                                style: AppTextStyle.white_14_w400),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: TextButton.icon(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.timelapse_outlined,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    '등록시간 : ${DateTime.now().toFullDateTimeString5()}',
                                    style: AppTextStyle.white_14_w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.message),
                                label: Text('메시지복사',
                                    style: AppTextStyle.white_14_w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                        'assets/icons/battlenet.png'),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('배틀태그 : betrider#12345',
                                      style: AppTextStyle.white_14_w400),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child:
                                        Image.asset('assets/icons/diablo2.png'),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('아이디 : 베트라이더',
                                      style: AppTextStyle.white_14_w400),
                                ],
                              ),
                            ),
                          ),
                        ],
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
