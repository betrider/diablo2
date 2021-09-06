import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/screens/exchange_ladder/exchange_ladder_screen.dart';
import 'package:flutter_diablo2_exchange/screens/item_dictionary/item_dictionary_screen.dart';
import 'package:flutter_diablo2_exchange/screens/exchange_standard/exchange_standard_screen.dart';
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
  final GlobalKey<ExchangeStandardScreenState> _standardKey =
      new GlobalKey<ExchangeStandardScreenState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if(_controller.selectedIndex == 0){ //스탠다드
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
      _standardKey.currentState!.load();
    }
    }else if(_controller.selectedIndex == 1){ //래더

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
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
                      return ExchangeStandardScreen(key: _standardKey);
                    case 1:
                      return ExchangeLadderScreen();
                    // case 2:
                    //   return ItemDictionaryScreen();
                    default:
                      return ExchangeStandardScreen(key: _standardKey);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          // _scrollController.jumpTo(0);
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        child: Icon(
          Icons.arrow_circle_up,
          color: Colors.black,
        ),
        mini: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
