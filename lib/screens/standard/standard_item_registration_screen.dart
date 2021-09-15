import 'package:flutter_diablo2_exchange/index.dart';

class StandardItemRegistrationScreen extends StatelessWidget {
  const StandardItemRegistrationScreen({Key? key}) : super(key: key);

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
                  Wrap(
                    spacing: kDefaultPadding * 2,
                    runSpacing: kDefaultPadding * 2,
                    children: [
                      ListItemInfo(
                        listItemModel: ListItemModel(
                          boardId: '0001',
                          itemModel: ItemModel(
                            itemQuality: ItemQuality.Unique,
                            name: 'test',
                            additionalProperties: [],
                            basicProperties: [],
                          ),
                          battleTagId: 'betrider#12345',
                          dateTime: DateTime.now().toFullDateTimeString5(),
                          diabloId: 'BETRIDER',
                          memo: '메모입니다.1\n메모입니다.2\n메모입니다.',
                        ),
                      ),
                      ListItemInfo(
                        listItemModel: ListItemModel(
                          boardId: '0001',
                          itemModel: ItemModel(
                            itemQuality: ItemQuality.Unique,
                            name: 'test',
                            additionalProperties: [],
                            basicProperties: [],
                          ),
                          battleTagId: 'betrider#12345',
                          dateTime: DateTime.now().toFullDateTimeString5(),
                          diabloId: 'BETRIDER',
                          memo: '메모입니다.1\n메모입니다.2\n메모입니다.',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
