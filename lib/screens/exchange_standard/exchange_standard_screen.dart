import 'package:flutter_diablo2_exchange/controllers/searchController.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:loadmore/loadmore.dart';

class ExchangeStandardScreen extends StatefulWidget {
  @override
  _ExchangeStandardScreenState createState() => _ExchangeStandardScreenState();
}

class _ExchangeStandardScreenState extends State<ExchangeStandardScreen> {
  int get count => list.length;
  List<int> list = [];
  final SearchController _searchController = Get.find();

  @override
  void initState() {
    super.initState();
    _searchController.clear();
  }

  void load() {
    setState(() {
      list.addAll(List.generate(20, (v) => v));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/body_background.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
          child: Column(
            children: [
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size20('필터 1 : 아이템 등급'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Flexible(child: TabChipsItemQulity()),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size20('필터 2 : 아이템 유형'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Flexible(child: TabChipsItemType()),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size20('필터 3 : 아이템 옵션\n유니크, 세트, 룬워드 한정'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size20('필터 4 : 아이템 옵션'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size20('필터 5 : 아이템 가격'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              if (count == 0) ...[
                ElevatedButton(
                  onPressed: () {
                    _searchController.updateSearchOnoff();
                    setState(() {
                      list.addAll(List.generate(20, (v) => v));
                    });
                  },
                  child: Text('아이템 검색'),
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
              ] else ...[
                GetBuilder<SearchController>(
                  builder: (controller) {
                    return LoadMore(
                      isFinish: count >= controller.searchCount,
                      onLoadMore: _loadMore,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Text(list[index].toString()),
                            height: 40.0,
                            alignment: Alignment.center,
                          );
                        },
                        itemCount: count,
                      ),
                      whenEmptyLoad: false,
                      delegate: DefaultLoadMoreDelegate(),
                      textBuilder: DefaultLoadMoreTextBuilder.chinese,
                    );
                  },
                ),
              ],
            ],
          ),
        ));
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  // ignore: unused_element
  Opacity _getItem() {
    return Opacity(
      opacity: 0.9,
      child: Container(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
          color: ItemColor.black,
          child: Column(
            children: [
              Text(
                '구울 슬레이어',
                style: TextStyle(
                  color: ItemColor.yellowGold,
                ),
              ),
              Text(
                '주얼',
                style: TextStyle(color: ItemColor.yellowGold),
              ),
              Text(
                '소켓 아이템용',
                style: TextStyle(color: ItemColor.white),
              ),
              Text(
                '착용 가능한 레벨: 41',
                style: TextStyle(color: ItemColor.white),
              ),
              Text(
                '+7% 매우 빠른 회복속도 증가',
                style: TextStyle(color: ItemColor.blue),
              ),
              Text(
                '+9 힘',
                style: TextStyle(color: ItemColor.blue),
              ),
              Text(
                '+9 민첩성',
                style: TextStyle(color: ItemColor.blue),
              ),
              Text(
                '모든 저항력 +10',
                style: TextStyle(color: ItemColor.blue),
              ),
            ],
          )),
    );
  }
}

class TabChipsItemQulity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabChipsItemQulityState();
}

class _TabChipsItemQulityState extends State<TabChipsItemQulity> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: itemQuality.mapWithIndex(
        (value, index) {
          return ChoiceChip(
            selected: _selectedIndex == index,
            selectedColor: itemQualityColor[index],
            label: Text(
              "$value",
              style: AppTextStyle.black_12_bold,
            ),
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
          );
        },
      ),
    );
  }
}

class TabChipsItemType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabChipsItemTypeState();
}

class _TabChipsItemTypeState extends State<TabChipsItemType> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: itemType.mapWithIndex(
        (value, index) {
          return ChoiceChip(
            selected: _selectedIndex == index,
            // selectedColor: itemQualityColor[index],
            label: Text(
              "$value",
              style: AppTextStyle.black_12_bold,
            ),
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
          );
        },
      ),
    );
  }
}
