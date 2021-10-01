import 'package:flutter_diablo2_exchange/index.dart';
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

  String selectItem = '';

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
                          children: [
                            _getItemOption(),
                            SizedBox(
                              height: kDefaultPadding * 2,
                            ),
                            _getItemPreview(),
                          ],
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _getItemOption(),
                              SizedBox(
                                width: kDefaultPadding * 2,
                              ),
                              _getItemPreview(),
                            ],
                          ),
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
        CustomTitle.size20('아이템 미리보기'),
        SizedBox(height: kDefaultPadding),
        ListItemInfo(
          listItemModel: ListItemModel(
            boardId: '',
            itemImagePath: 'assets/images/runeword sample.png',
            dealStatus: DealStatus.REGISTERED,
            dealType: DealType.SELL,
            battleTagId: userController.battleTagId!,
            dateTime: DateTime.now().toFullDateTimeString5(),
            diabloId: userController.diabloId!,
            memo: '메모입니다.1\n메모입니다.2\n메모입니다.',
          ),
        ),
      ],
    );
  }

  Column _getItemPreview() {
    return Column(
      children: [
        CustomTitle.size20('아이템 옵션선택'),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
        InputField(
          label: "옵션1",
          labelWidth: 120,
          content: "옵션1을 입력해주세요.",
          onChanged: (value) {
            print('option1');
          },
          onFieldSubmitted: (value) {},
          validator: customDialogIdValidate,
        ),
        SizedBox(height: kDefaultPadding),
      ],
    );
  }

  // Column(
  //   children: [
  //     CustomTitle.size20('아이템 옵션'),
  //     SizedBox(height: kDefaultPadding),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         SizedBox(
  //           width: 200,
  //           child: CustomTitle.size20('아이템 유형'),
  //         ),
  //         SizedBox(
  //           width: kDefaultPadding,
  //         ),
  //         // Expanded(
  //         //   child: _itemTypeDropdown(),
  //         // ),
  //       ],
  //     ),
  //   ],
  // ),

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
