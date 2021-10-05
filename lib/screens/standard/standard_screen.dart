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
  TextEditingController memoTextController = TextEditingController();

  bool isSearch = false;

  String selectItemGrade = '';
  String selectItemType = '';
  String selectItemName = '';
  String searchText = '';

  void load() async {
    if (isSearch) {
      itemListController.updateLoading(true);
      await Future.delayed(Duration(seconds: 0, milliseconds: 2000)); //api 호출
      itemListController.itemAdd();
      itemListController.updateLoading(false);
    }
  }

  void reset() async {
    if (!isSearch) {
      itemListController.reset();
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
                SizedBox(height: kDefaultPadding * 2),
                _getFirstItemGrade(context), // 2.1 아이템 등급
                SizedBox(height: kDefaultPadding * 2),
                _getSecondItemType(context), // 2.2 아이템 유형
                SizedBox(height: kDefaultPadding * 2),
                _getThirdItemName(context), // 2.3 아이템명
                SizedBox(height: kDefaultPadding * 2),
                _getSearchText(context), // 2.4 메모
                GetBuilder<ItemListController>(
                  builder: (controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                            SizedBox(
                              width: kDefaultPadding,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                isSearch = false;
                                reset();
                              },
                              child: Text(
                                '검색 초기화',
                                style: TextStyle(fontFamily: 'kodia'),
                              ),
                            ),
                          ],
                        ),
                        if (isSearch) ...[
                          if (controller.count > 0) ...[
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
                                      itemImagePath: '',
                                      dealStatus: index % 2 == 0
                                          ? DealStatus.REGISTERED
                                          : DealStatus.COMPLETE,
                                      dealType: index % 2 == 0
                                          ? DealType.SELL
                                          : DealType.BUY,
                                      battleTagId: 'betrider#12345',
                                      dateTime: DateTime.now()
                                          .toFullDateTimeString5(),
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
                          ],
                          if (controller.isLoading) ...[
                            SizedBox(
                              height: kDefaultPadding * 2,
                            ),
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
                onChanged: (itemGrade) {
                  setState(() {
                    selectItemGrade = itemGrade;
                  });
                },
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
                  onChanged: (itemGrade) {
                    setState(() {
                      selectItemGrade = itemGrade;
                    });
                  },
                ),
              ),
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

  Widget _getSearchText(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('상세내용검색'),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              SizedBox(
                width: double.infinity,
                child: InputField(
                  label: '',
                  content: '검색어를 입력해주세요.',
                  controller: memoTextController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  suffixIcon: IconButton(
                    onPressed: memoTextController.clear,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey[600]!,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: CustomTitle.size20('상세내용검색'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: InputField(
                  label: '',
                  content: '검색어를 입력해주세요.',
                  controller: memoTextController,
                  onChanged: (value) {},
                  suffixIcon: IconButton(
                    onPressed: memoTextController.clear,
                    icon: Icon(Icons.clear, color: Colors.white),
                  ),
                ),
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
      value: selectItemType,
      style: AppTextStyle.white_14_w400,
      hint: Text("아이템 유형을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 1개만 선택가능합니다.", style: AppTextStyle.white_14_w400),
      onChanged: (value) {
        setState(() {
          selectItemType = value;
        });
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

    List<String> itemList = ['All', 'aaa', 'bbb', 'ccc', 'ddd']; //샘플자료

    return SearchableDropdown.single(
      iconEnabledColor: Colors.white,
      items: itemList
          .mapWithIndex(
            (value, index) => DropdownMenuItem(
              child: Text(value.tr, style: AppTextStyle.white_14_w400),
              value: value.tr,
            ),
          )
          .toList(),
      value: selectItemName,
      style: AppTextStyle.white_14_w400,
      hint: Text("아이템을 선택해주세요.", style: AppTextStyle.white_14_w400),
      searchHint: Text("최대 1개만 선택가능합니다.", style: AppTextStyle.white_14_w400),
      onChanged: (value) {
        setState(() {
          selectItemName = value;
        });
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
}
