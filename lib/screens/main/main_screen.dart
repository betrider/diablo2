import 'package:flutter_diablo2_exchange/controllers/searchController.dart';
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
  final SearchController _searchController =
      Get.put(SearchController());
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      _searchController.increaseIndex(20);
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
                      return ExchangeStandardScreen();
                    case 1:
                      return ExchangeLadderScreen();
                    case 2:
                      return ItemDictionaryScreen();
                    default:
                      return ExchangeStandardScreen();
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
