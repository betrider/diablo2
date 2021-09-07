import 'package:flutter_diablo2_exchange/index.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:searchable_dropdown/searchable_dropdown.dart';

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

  List<int> selectedItems = [];

  String selectItem = '';

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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 750,
        minWidth: double.infinity
      ),
      child: Container(
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
                SizedBox(height: kDefaultPadding * 2),
                // _buySellType(), // 1.buy,sell 유형
                // SizedBox(height: kDefaultPadding * 2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTitle.size30('1.검색 필터'),
                ),
                SizedBox(height: kDefaultPadding * 2),
                _getFirstItemGrade(), // 2.1아이템 등급
                SizedBox(height: kDefaultPadding * 2),
                _getSecondItemType(), // 2.2아이템 유형
                SizedBox(height: kDefaultPadding * 2),
                _getThirdItemName(), // 2.3아이템명
                SizedBox(height: kDefaultPadding * 2),
                _getFourthItemPrefix(), // 2.4-1아이템 접두사
                SizedBox(height: kDefaultPadding * 2),
                _getFourthItemSuffix(), // 2.4-2 아이템 접미사
                // SizedBox(height: kDefaultPadding * 2),
                // _getItemGoods(), // 3.아이템 재화
                SizedBox(
                  height: kDefaultPadding * 4,
                ),
                if (!isSearch) ...[
                  SizedBox(
                      height: kDefaultPadding * 2,
                    ),
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
                  Container(
                    width: 600,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItemInfo();
                      },
                      itemCount: count,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: kDefaultPadding / 2,
                        );
                      },
                    ),
                  ),
                  if (isLoading) ...[
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
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
                ],
                SizedBox(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          )),
    );
  }

  Row _getItemGoods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
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
    );
  }

  Row _getFourthItemSuffix() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('옵션(접미사)'),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: SearchableDropdown.multiple(
            iconEnabledColor: Colors.white,
            items: [
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
            ],
            selectedItems: selectedItems,
            hint: Text("Select 3 Items", style: AppTextStyle.white_14_w400),
            searchHint: Text("유니크 > 무기", style: AppTextStyle.white_14_w400),
            style: AppTextStyle.white_14_w400,
            onChanged: (value) {
              setState(() {
                selectedItems = value;
              });
            },
            doneButton: (selectedItemsDone, doneContext) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pop(doneContext);
                  setState(() {});
                },
                child: Text("저장", style: AppTextStyle.white_14_w400),
              );
            },
            closeButton: null,
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Row _getFourthItemPrefix() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('옵션(접두사)'),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: SearchableDropdown.multiple(
            iconEnabledColor: Colors.white,
            items: [
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
              DropdownMenuItem(
                child: Text('접두사1', style: AppTextStyle.white_14_w400),
                value: '접두사1',
              ),
              DropdownMenuItem(
                child: Text('접두사2', style: AppTextStyle.white_14_w400),
                value: '접두사2',
              ),
              DropdownMenuItem(
                child: Text('접두사3', style: AppTextStyle.white_14_w400),
                value: '접두사3',
              ),
            ],
            selectedItems: selectedItems,
            hint: Text("Select 3 Items", style: AppTextStyle.white_14_w400),
            searchHint:
                Text("Select 3 Items", style: AppTextStyle.white_14_w400),
            style: AppTextStyle.white_14_w400,
            onChanged: (value) {
              setState(() {
                selectedItems = value;
              });
            },
            doneButton: (selectedItemsDone, doneContext) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pop(doneContext);
                  setState(() {});
                },
                child: Text("저장", style: AppTextStyle.white_14_w400),
              );
            },
            closeButton: null,
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Row _getThirdItemName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('아이템 종류'),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: SearchableDropdown.single(
            iconEnabledColor: Colors.white,
            items: [
              DropdownMenuItem(
                child:
                    Text('The Grandfather', style: AppTextStyle.white_14_w400),
                value: 'The Grandfather',
              ),
              DropdownMenuItem(
                child: Text(
                  'bbb',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'bbb',
              ),
              DropdownMenuItem(
                child: Text(
                  'cc',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'cc',
              ),
              DropdownMenuItem(
                child:
                    Text('The Grandfather', style: AppTextStyle.white_14_w400),
                value: 'The Grandfather',
              ),
              DropdownMenuItem(
                child: Text(
                  'bbb',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'bbb',
              ),
              DropdownMenuItem(
                child: Text(
                  'cc',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'cc',
              ),
              DropdownMenuItem(
                child:
                    Text('The Grandfather', style: AppTextStyle.white_14_w400),
                value: 'The Grandfather',
              ),
              DropdownMenuItem(
                child: Text(
                  'bbb',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'bbb',
              ),
              DropdownMenuItem(
                child: Text(
                  'cc',
                  style: AppTextStyle.white_14_w400,
                ),
                value: 'cc',
              ),
            ],
            value: selectItem,
            style: AppTextStyle.white_14_w400,
            hint: Text("Select one", style: AppTextStyle.white_14_w400),
            searchHint: Text("유니크 > 무기", style: AppTextStyle.white_14_w400),
            onChanged: (value) {
              print('1234');
              selectItem = value;
              Get.back();
            },
            // doneButton: (selectedItemsDone, doneContext) {
            //   return ElevatedButton(
            //     onPressed: () {
            //       print('2345');
            //       Navigator.pop(doneContext);
            //       setState(() {});
            //     },
            //     child: Text("닫기", style: AppTextStyle.white_14_w400),
            //   );
            // },
            closeButton: null,
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Row _getSecondItemType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('아이템 유형'),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: SearchableDropdown.single(
            iconEnabledColor: Colors.white,
            items: itemType
                .mapWithIndex(
                  (value, index) => DropdownMenuItem(
                    child: Text(value.tr, style: AppTextStyle.white_14_w400),
                    value: value.tr,
                  ),
                )
                .toList(),
            // items: [
            // DropdownMenuItem(
            //   child:
            //       Text('The Grandfather', style: AppTextStyle.white_14_w400),
            //   value: 'The Grandfather',
            // ),
            // ],
            value: selectItem,
            style: AppTextStyle.white_14_w400,
            hint: Text("Select one", style: AppTextStyle.white_14_w400),
            searchHint: Text("유니크 > 무기", style: AppTextStyle.white_14_w400),
            onChanged: (value) {
              selectItem = value;
              Get.back();
            },
            // doneButton: (selectedItemsDone, doneContext) {
            //   return ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(doneContext);
            //       setState(() {});
            //     },
            //     child: Text("닫기", style: AppTextStyle.white_14_w400),
            //   );
            // },
            closeButton: null,
            isExpanded: true,
          ),
        ),
        // Flexible(child: ChipGroup(items: itemType)),
      ],
    );
  }

  Row _getFirstItemGrade() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('아이템 등급'),
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
    );
  }

  Row _buySellType() {
    return Row(
      children: [
        SizedBox(
          width: 200,
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
    );
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
