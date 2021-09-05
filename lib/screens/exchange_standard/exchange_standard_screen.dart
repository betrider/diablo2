import 'package:flutter_diablo2_exchange/index.dart';

class ExchangeStandardScreen extends StatefulWidget {
  const ExchangeStandardScreen({Key? key}) : super(key: key);

  @override
  ExchangeStandardScreenState createState() => ExchangeStandardScreenState();
}

class ExchangeStandardScreenState extends State<ExchangeStandardScreen> {
  int get count => list.length;
  List<int> list = [];
  bool isSearch = false;
  bool isLoading = false;

  void load() async {
    if (isSearch) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 0, milliseconds: 2000));

      setState(() {
        isLoading = false;
        list.addAll(List.generate(20, (v) => v));
      });
    }
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
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size30('1.거래유형'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  RadioGroup(
                    radioMap: {'buy': '삽니다', 'sell': '팝니다'},
                    onChanged: (value) {},
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTitle.size30('2.검색 필터'),
              ),
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
                  Flexible(
                      child: ChipGroup(
                    items: itemQuality,
                    itemsColor: itemQualityColor,
                  )),
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
                  Flexible(child: ChipGroup(items: itemType)),
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
              // Divider(
              //   color: Colors.white,
              // ),
              // SizedBox(
              //   height: kDefaultPadding,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: CustomTitle.size30('3.거래재화'),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Flexible(
                      child: ChipGroup(
                    items: tradeItem,
                    itemsColor: [
                      ItemColor.white,
                      ItemColor.orange,
                      ItemColor.red,
                      ItemColor.blue,
                      ItemColor.yellow,
                      ItemColor.green,
                      ItemColor.white,
                      ItemColor.purple,
                      ItemColor.grey,
                    ],
                    itemsImagePath: [
                      '',
                      'icons/runes/Gul_Rune_25.png',
                      'icons/gems/perfect_ruby.png',
                      'icons/gems/perfect_saphire.png',
                      'icons/gems/perfect_topaz.png',
                      'icons/gems/perfect_emerald.png',
                      'icons/gems/perfect_diamond.png',
                      'icons/gems/perfect_amethyst.png',
                      'icons/gems/perfect_skull.png'
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 6,
              ),
              if (!isSearch) ...[
                ElevatedButton(
                  onPressed: () {
                    isSearch = true;
                    load();
                  },
                  child: Text(
                    '아이템 검색',
                    style: TextStyle(fontFamily: 'kodia'),
                  ),
                ),
              ] else ...[
                ListView.builder(
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
                if (isLoading)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text('로딩중입니다...', style: AppTextStyle.white_14_w400)
                    ],
                  ),
              ],
              SizedBox(
                height: kDefaultPadding,
              )
            ],
          ),
        ));
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
