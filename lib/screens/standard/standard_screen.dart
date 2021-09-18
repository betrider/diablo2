import 'package:flutter_diablo2_exchange/index.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:searchable_dropdown/searchable_dropdown.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({Key? key}) : super(key: key);

  @override
  StandardScreenState createState() => StandardScreenState();
}

class StandardScreenState extends State<StandardScreen> {
  ItemListController itemListController = Get.put(ItemListController());

  bool isSearch = false;

  int prefixMaxCount = 3;
  int suffixMaxCount = 1;
  List<int> itemPrifixList = [];
  List<int> itemSuffixList = [];

  String selectItem = '';

  void load() async {
    if (isSearch) {
      itemListController.updateLoading(true);
      await Future.delayed(Duration(seconds: 0, milliseconds: 2000)); //api 호출
      itemListController.itemAdd();
      itemListController.updateLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: Get.height - 200, minWidth: double.infinity),
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/body_background.jpg'),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? kDefaultPadding
                    : kDefaultPadding * 4),
            child: Column(
              children: [
                // SizedBox(height: kDefaultPadding * 2),
                // _buySellType(context), // 1.buy,sell 유형
                // SizedBox(height: kDefaultPadding * 2),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: CustomTitle.size30('1.검색 필터'),
                // ),
                SizedBox(height: kDefaultPadding * 2),
                _getFirstItemGrade(context), // 2.1아이템 등급
                SizedBox(height: kDefaultPadding * 2),
                _getSecondItemType(context), // 2.2아이템 유형
                SizedBox(height: kDefaultPadding * 2),
                _getThirdItemName(context), // 2.3아이템명
                SizedBox(height: kDefaultPadding * 2),
                _getFourthItemPrefix(context), // 2.4-1아이템 접두사
                SizedBox(height: kDefaultPadding * 2),
                _getFourthItemSuffix(context), // 2.4-2 아이템 접미사
                // SizedBox(height: kDefaultPadding * 2),
                // _getItemGoods(context), // 3.아이템 재화
                // SizedBox(
                //   height: kDefaultPadding * 2,
                // ),
                GetBuilder<ItemListController>(
                  builder: (controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                          SizedBox(
                              height: kDefaultPadding * 2,
                            ),
                          Container(
                            width: 600,
                            child: ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return ListItemInfo(
                                  listItemModel: ListItemModel(
                                    boardId: '0001',
                                    itemModel: ItemModel(
                                      itemQuality: ItemQuality.Unique,
                                      index: 'test',
                                      code: '7gd',
                                      reqLevel: 50,
                                      additionalProperties: [],
                                      basicProperties: [],
                                    ),
                                    battleTagId: 'betrider#12345',
                                    dateTime:
                                        DateTime.now().toFullDateTimeString5(),
                                    diabloId: 'BETRIDER',
                                    memo: '메모입니다.1\n메모입니다.2\n메모입니다.3',
                                  ),
                                );
                              },
                              itemCount: controller.count,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: kDefaultPadding / 2,
                                );
                              },
                            ),
                          ),
                          if (controller.isLoading) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                                SizedBox(
                                  width: kDefaultPadding,
                                ),
                                Text('로딩중입니다...',
                                    style: AppTextStyle.white_14_w400)
                              ],
                            ),
                          ],
                        ],
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          )),
    );
  }

  Widget _getFirstItemGrade(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('아이템 등급'),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ChipGroup(
                items: itemQualityList.firstAddText(),
                itemsColor: itemQualityColor.firstAddColor(),
              ),
            ],
          )
        : Row(
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
                items: itemQualityList.firstAddText(),
                itemsColor: itemQualityColor.firstAddColor(),
              )),
            ],
          );
  }

  Widget _getSecondItemType(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('아이템 유형'),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              _itemTypeDropdown(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('아이템 유형'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _itemTypeDropdown(),
              ),
            ],
          );
  }

  Widget _getThirdItemName(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('아이템 이름'),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              _itemNameDropdown(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('아이템 이름'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _itemNameDropdown(),
              ),
            ],
          );
  }

  Widget _getFourthItemPrefix(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('옵션(접두사)'),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              _prefixDropdown(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('옵션(접두사)'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(child: _prefixDropdown()),
            ],
          );
  }

  Widget _getFourthItemSuffix(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('옵션(접미사)'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              _suffixDropdown(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('옵션(접미사)'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _suffixDropdown(),
              ),
            ],
          );
  }

  SearchableDropdown<String> _itemTypeDropdown() {
    return SearchableDropdown.single(
      iconEnabledColor: Colors.white,
      items: itemType
          .mapWithIndex(
            (value, index) => DropdownMenuItem(
              child: Text(value.tr, style: AppTextStyle.white_14_w400),
              value: value.tr,
            ),
          )
          .toList(),
      value: selectItem,
      style: AppTextStyle.white_14_w400,
      hint: Text("아이템 유형을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 1개만 선택가능합니다.", style: AppTextStyle.white_14_w400),
      onChanged: (value) {
        selectItem = value;
        Get.back();
      },
      closeButton: Align(
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white),
          ),
          onPressed: () {
            Get.back();
            setState(() {});
          },
          child: Text("닫기", style: AppTextStyle.white_14_w400),
        ),
      ),
      isExpanded: true,
    );
  }

  SearchableDropdown<String> _itemNameDropdown() {
    return SearchableDropdown.single(
      iconEnabledColor: Colors.white,
      items: [
        DropdownMenuItem(
          child: Text('The Grandfather', style: AppTextStyle.white_14_w400),
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
          child: Text('The Grandfather', style: AppTextStyle.white_14_w400),
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
          child: Text('The Grandfather', style: AppTextStyle.white_14_w400),
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
      hint: Text("아이템을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 1개만 선택가능합니다.", style: AppTextStyle.white_14_w400),
      onChanged: (value) {
        selectItem = value;
        Get.back();
      },
      closeButton: Align(
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            Get.back();
            setState(() {});
          },
          child: Text("닫기", style: AppTextStyle.white_14_w400),
        ),
      ),
      isExpanded: true,
    );
  }

  SearchableDropdown<String> _prefixDropdown() {
    return SearchableDropdown.multiple(
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
      selectedItems: itemPrifixList,
      hint: Text("접두사 항목을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 $prefixMaxCount개까지 선택이 가능합니다.",
          style: AppTextStyle.white_14_w400),
      style: AppTextStyle.white_14_w400,
      validator: (selectedItemsForValidator) {
        if (selectedItemsForValidator.length > prefixMaxCount) {
          return ("최대 개수를 초과했습니다.");
        } else {
          return (null);
        }
      },
      onChanged: (value) {
        setState(() {});
      },
      doneButton: (selectedItemsDone, doneContext) {
        return selectedItemsDone.length > prefixMaxCount
            ? ElevatedButton(
                onPressed: null,
                child: Text("저장", style: AppTextStyle.white_14_w400),
              )
            : ElevatedButton(
                onPressed: () {
                  Navigator.pop(doneContext);
                  setState(() {
                    itemPrifixList = selectedItemsDone;
                  });
                },
                child: Text("저장", style: AppTextStyle.white_14_w400),
              );
      },
      closeButton: Align(
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            Get.back();
            setState(() {});
          },
          child: Text("닫기", style: AppTextStyle.white_14_w400),
        ),
      ),
      isExpanded: true,
    );
  }

  SearchableDropdown<String> _suffixDropdown() {
    return SearchableDropdown.multiple(
      iconEnabledColor: Colors.white,
      items: [
        DropdownMenuItem(
          child: Text('접미사1', style: AppTextStyle.white_14_w400),
          value: '접미사1',
        ),
        DropdownMenuItem(
          child: Text('접미사2', style: AppTextStyle.white_14_w400),
          value: '접미사2',
        ),
        DropdownMenuItem(
          child: Text('접미사3', style: AppTextStyle.white_14_w400),
          value: '접미사3',
        ),
        DropdownMenuItem(
          child: Text('접미사1', style: AppTextStyle.white_14_w400),
          value: '접미사1',
        ),
        DropdownMenuItem(
          child: Text('접미사2', style: AppTextStyle.white_14_w400),
          value: '접미사2',
        ),
        DropdownMenuItem(
          child: Text('접미사3', style: AppTextStyle.white_14_w400),
          value: '접미사3',
        ),
        DropdownMenuItem(
          child: Text('접미사1', style: AppTextStyle.white_14_w400),
          value: '접미사1',
        ),
        DropdownMenuItem(
          child: Text('접미사2', style: AppTextStyle.white_14_w400),
          value: '접미사2',
        ),
        DropdownMenuItem(
          child: Text('접미사3', style: AppTextStyle.white_14_w400),
          value: '접미사3',
        ),
      ],
      selectedItems: itemSuffixList,
      hint: Text("접미사 항목을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 $suffixMaxCount개까지 선택이 가능합니다.",
          style: AppTextStyle.white_14_w400),
      style: AppTextStyle.white_14_w400,
      validator: (selectedItemsForValidator) {
        if (selectedItemsForValidator.length > suffixMaxCount) {
          return ("최대 개수를 초과했습니다.");
        } else {
          return (null);
        }
      },
      onChanged: (value) {
        setState(() {});
      },
      doneButton: (selectedItemsDone, doneContext) {
        return selectedItemsDone.length > suffixMaxCount
            ? ElevatedButton(
                onPressed: null,
                child: Text("저장", style: AppTextStyle.white_14_w400),
              )
            : ElevatedButton(
                onPressed: () {
                  Navigator.pop(doneContext);
                  setState(() {
                    itemSuffixList = selectedItemsDone;
                  });
                },
                child: Text("저장", style: AppTextStyle.white_14_w400),
              );
      },
      closeButton: Align(
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            Get.back();
            setState(() {});
          },
          child: Text("닫기", style: AppTextStyle.white_14_w400),
        ),
      ),
      isExpanded: true,
    );
  }
}
