import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/widgets/sample/home.dart';

import 'screens/auth/auth.dart';

class RouteGenerator {
  static void routingCallback(Routing? routing) {
    //푸시 이전 호출 , 팝 이후 호출
    print('routing 콜백: ${routing!.route}');
  }

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: '/sample', page: () => SamplePage()),
      GetPage(name: '/sample/:uid', page: () => SampleArgumentPage()),

      GetPage(name: '/sign_in', page: () => SignInScreen()), //로그인
      GetPage(name: '/sign_up', page: () => SignUpScreen()), //회원가입
      GetPage(name: '/sign_out', page: () => SignOutScreen()), //로그아웃
    ];
  }
}

// Get.to(NextPage()) //새로운 화면으로 이동합니다:
// Get.toNamed('/next'); //새로운 화면으로 이동합니다:
// Get.back() //스낵바, 다이얼로그, bottomsheets 또는 Navigator.pop(context);로 닫아야 하는 어떤것도 닫게 합니다:
// Get.off(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (1개)
// Get.off미ㅣ(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (모두)

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("동적 Url"),
            onPressed: () {
              Get.toNamed('/sample/213?name=Giyeon&age=27');
            },
          ),
        ),
      ),
    );
  }
}

class SampleArgumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${Get.parameters['uid']}'),
            Text('${Get.parameters['name']}'),
            Text('${Get.parameters['age']}'),
          ],
        ),
      ),
    );
  }
}

class Sample12 extends StatelessWidget {
  const Sample12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListItemInfo(),
                ListItemInfo(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class Sample123 extends StatelessWidget {
  const Sample123({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/body_background.jpg'),
              //   repeat: ImageRepeat.repeat,
              // ),
              border: Border.all(width: 1),
              color: Colors.grey[850]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ItemInfo(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
            ],
          ),
          // child: Center(
          //   child: InkWell(
          //     onTap: () {
          //       showWidgetDialog(ItemInfo());
          //     },
          //     child: Container(
          //       width: 600,
          //       decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         border: Border.all(width: 1),
          //       ),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           FittedBox(
          //             fit: BoxFit.fill,
          //             child: ItemInfo(),
          //           ),
          //           SizedBox(
          //             height: 50,
          //             child: Row(
          //               children: [
          //                 Flexible(
          //                     child: Container(
          //                   color: Colors.yellow,
          //                 )),
          //                 Container(
          //                   height: 50,
          //                   child: VerticalDivider(
          //                     color: Colors.black,
          //                     width: 1,
          //                   ),
          //                 ),
          //                 Flexible(
          //                     child: Container(
          //                   color: Colors.blue,
          //                 )),
          //               ],
          //             ),
          //           ),
          //           SizedBox(
          //             height: 50,
          //             child: Row(
          //               children: [
          //                 Flexible(
          //                     child: Container(
          //                   color: Colors.blue,
          //                 )),
          //                 Container(
          //                   height: 50,
          //                   child: VerticalDivider(
          //                     color: Colors.black,
          //                     width: 1,
          //                   ),
          //                 ),
          //                 Flexible(
          //                     child: Container(
          //                   color: Colors.yellow,
          //                 )),
          //               ],
          //             ),
          //           )
          // Column(
          //   children: [
          //     ConstrainedBox(
          //         constraints: BoxConstraints(minHeight: 50),
          //         child: Container(
          //           width: double.infinity,
          //           color: Colors.white,
          //           padding: EdgeInsets.symmetric(horizontal: 8),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               Text(DateTime.now().toFullDateTimeString5()),
          // Container(
          //   height: 25,
          //   child: VerticalDivider(color: Colors.black),
          // ),
          // OutlinedButton.icon(
          //   onPressed: () {},
          //   icon: Icon(Icons.message),
          //   label: Text('메시지복사'),
          // ),
          //             ],
          //           ),
          //         )),
          // ConstrainedBox(
          //     constraints: BoxConstraints(minHeight: 50),
          //     child: Container(
          //       width: double.infinity,
          //       color: Colors.white,
          //       padding: EdgeInsets.symmetric(horizontal: 8),
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: Row(
          //               children: [
          // SizedBox(
          //   width: 24,
          //   height: 24,
          //   child: Image.asset(
          //       'assets/icons/battlenet.png'),
          // ),
          // SizedBox(
          //   width: 2,
          // ),
          // Text('배틀태그 : betrider#12345'),
          //               ],
          //             ),
          //           ),
          //           Container(
          //             height: 25,
          //             child: VerticalDivider(color: Colors.black),
          //           ),
          //           Expanded(
          //             child: Row(
          //               children: [
          // SizedBox(
          //   width: 24,
          //   height: 24,
          //   child:
          //       Image.asset('assets/icons/diablo2.png'),
          // ),
          // SizedBox(
          //   width: 2,
          // ),
          // Text('아이디 : 베트라이더'),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
          //   ],
          // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

class Sample2 extends StatefulWidget {
  const Sample2({Key? key}) : super(key: key);

  @override
  _Sample2State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showWidgetDialog(ItemInfo());
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: FittedBox(
                  child: ItemInfo(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
