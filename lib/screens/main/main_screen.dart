import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/screens/ladder/ladder_screen.dart';
import 'package:flutter_diablo2_exchange/screens/standard/standard_screen.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MenuController _controller =
      Get.put(MenuController(getCache.get('pageIndex')));
  final _scrollController = ScrollController();
  final GlobalKey<StandardScreenState> _standardKey =
      new GlobalKey<StandardScreenState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_controller.selectedIndex == 0) {
      //스탠다드
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _standardKey.currentState!.load();
      }
    } else{
      //래더

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      resizeToAvoidBottomInset: false, //키보드 화면밀어내지 않게 설정
      body: Scrollbar(
        // isAlwaysShown: true, //스크롤 항상 보이게할지 여부
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Header(),
              GetBuilder<MenuController>(
                builder: (controller) {
                  switch (controller.selectedIndex) {
                    case 0:
                      return StandardScreen(key: _standardKey);
                    case 1:
                      return LadderScreen();
                    // case 2:
                    //   return ItemDictionaryScreen();
                    default:
                      return StandardScreen(key: _standardKey);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  _scrollController.animateTo(0,duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                child: Icon(
                  Icons.arrow_circle_up,
                  color: Colors.black,
                ),
                mini: true,
                backgroundColor: Colors.white,
              ),
            ),
            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                if (_controller.selectedIndex == 0) {
                  Get.toNamed('/standard_item_add');
                }else{
                  Get.toNamed('/ladder_item_add');
                }
              },
              icon: Icon(Icons.add_circle_outline_outlined),
              label: Text('아이템\n등록', style: AppTextStyle.white_14_w400, textAlign: TextAlign.center,),
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: null,
      //   onPressed: () {
      //     // _scrollController.jumpTo(0);
      //     _scrollController.animateTo(0,
      //         duration: Duration(milliseconds: 500), curve: Curves.ease);
      //   },
      //   child: Icon(
      //     Icons.arrow_circle_up,
      //     color: Colors.black,
      //   ),
      //   mini: true,
      //   backgroundColor: Colors.white,
      // ),
    );
  }
}
