import 'package:flutter_diablo2_exchange/index.dart';

class RouteGenerator {
  static void routingCallback(Routing? routing) {
    //푸시 이전 호출 , 팝 이후 호출
    print('routing 콜백: ${routing!.route}');
  }

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: '/sample', page: () => SamplePage()),
      GetPage(name: '/sample/:uid', page: () => SampleArgumentPage()),
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

  dynamic aa = UniqueItemModel(reqLevel: 66);

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
