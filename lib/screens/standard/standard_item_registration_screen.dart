import 'package:flutter_diablo2_exchange/index.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:searchable_dropdown/searchable_dropdown.dart';

class StandardItemRegistrationScreen extends StatefulWidget {
  const StandardItemRegistrationScreen({Key? key}) : super(key: key);

  @override
  _StandardItemRegistrationScreenState createState() =>
      _StandardItemRegistrationScreenState();
}

class _StandardItemRegistrationScreenState
    extends State<StandardItemRegistrationScreen> {
  UserController userController = Get.find<UserController>();
  TextEditingController memoTextController = TextEditingController();

  String selectItemGrade = '';
  String selectItemType = '';
  String selectItemName = '';
  String itemImagePath = '';
  String searchText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/body_background.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding * 2,
            horizontal: Responsive.isMobile(context)
                ? kDefaultPadding
                : kDefaultPadding * 4,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTitle.size30('아이템 등록(스탠다드)'),
                  SizedBox(height: kDefaultPadding * 2),
                  Responsive.isMobile(context)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _getItemOption(),
                            SizedBox(
                              height: kDefaultPadding * 2,
                            ),
                            _getItemPreview(),
                          ],
                        )
                      : Row(
                          children: [
                            _getItemOption(),
                            SizedBox(
                              width: kDefaultPadding * 2,
                            ),
                            _getItemPreview(),
                          ],
                        ),
                  SizedBox(height: kDefaultPadding * 2),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey[350]!),
                              ),
                              onPressed: () {
                                Get.toNamed('sign_up');
                              },
                              child: Text(
                                '초기화'.tr,
                                style: AppTextStyle.white_14_w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey[350]!),
                              ),
                              onPressed: () {
                                Get.toNamed('sign_up');
                              },
                              child: Text('등록하기'.tr,
                                  style: AppTextStyle.white_14_w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _getItemOption() {
    return Column(
      children: [
        CustomTitle.size24('아이템 미리보기'),
        SizedBox(height: kDefaultPadding * 2),
        ListItemInfo(
          listItemModel: ListItemModel(
            boardId: '',
            itemImagePath: itemImagePath,
            dealStatus: DealStatus.REGISTERING,
            dealType: DealType.SELL,
            battleTagId: userController.battleTagId!,
            dateTime: DateTime.now().toFullDateTimeString5(),
            diabloId: userController.diabloId!,
            memo: searchText,
          ),
        ),
      ],
    );
  }

  Column _getItemPreview() {
    return Column(
      children: [
        CustomTitle.size24('아이템 카테고리'),
        SizedBox(height: kDefaultPadding * 2),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTitle.size20('아이템 등급'),
        ),
        SizedBox(height: kDefaultPadding),
        ChipGroup(
          items: itemQualityList.firstAddText(),
          itemsColor: itemQualityColor.firstAddColor(),
          onChanged: (itemGrade) {
            setState(() {
              selectItemGrade = itemGrade;
            });
          },
        ),
        SizedBox(height: kDefaultPadding * 2),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTitle.size20('아이템 유형'),
        ),
        SizedBox(height: kDefaultPadding),
        _itemTypeDropdown(),
        SizedBox(height: kDefaultPadding * 2),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTitle.size20('아이템 이름'),
        ),
        SizedBox(height: kDefaultPadding),
        _itemNameDropdown(),
        SizedBox(height: kDefaultPadding * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitle.size20('이미지 업로드'),
            ElevatedButton.icon(
                onPressed: () async{
                  itemImagePath = await getImagePath();
                  setState(() {});
                },
                icon: Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                label: Text('업로드')),
          ],
        ),
        SizedBox(height: kDefaultPadding * 2),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTitle.size20('상세내용'),
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: '',
          content: '상세내용을 입력해주세요.',
          controller: memoTextController,
          onChanged: (value) {},
          suffixIcon: IconButton(
            onPressed: memoTextController.clear,
            icon: Icon(Icons.clear, color: Colors.white),
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
