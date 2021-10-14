import 'package:flutter_diablo2_exchange/index.dart';

class ListItemInfo extends StatelessWidget {
  const ListItemInfo({required this.listItemModel});

  final ListItemModel listItemModel;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: getOpacity(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          color: Color.fromRGBO(0, 0, 0, 0.9),
        ),
        width: 600,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.grey[850],
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          listItemModel.dealType == DealType.BUY
                              ? Text(
                                  '삽니다',
                                  style: AppTextStyle.green_14_w400,
                                )
                              : Text(
                                  '팝니다',
                                  style: AppTextStyle.red_14_w400,
                                ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          '유니크 > 무기 > 할배검',
                          style: AppTextStyle.white_14_w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          getText(),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 1,
                ),
                listItemModel.itemImagePath.isEmpty
                    ? Image.asset('assets/images/image-not-found.jpeg')
                    : Image.network(listItemModel.itemImagePath),
                Container(
                  width: double.infinity,
                  color: Colors.grey[800],
                  padding: EdgeInsets.all(8),
                  child: SelectableText(
                    listItemModel.memo,
                    style: AppTextStyle.white_14_w400,
                  ),
                ),
                Container(
                    color: Colors.grey[850],
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Responsive.isMobile(context)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _getDateTime(Alignment.center),
                              _copyMessage(Alignment.center),
                              _getBattleTag(Alignment.center),
                              _getDiabloId(Alignment.center)
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _getDateTime(Alignment.centerLeft),
                                  ), //등록시간
                                  Expanded(
                                    child: _copyMessage(Alignment.centerLeft),
                                  ), //메시지복사
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _getBattleTag(Alignment.centerLeft),
                                  ), //배틀태그
                                  Expanded(
                                    child: _getDiabloId(Alignment.centerLeft),
                                  ), //디아블로 아이디
                                ],
                              ),
                            ],
                          )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getOpacity() {
    if (listItemModel.dealStatus == DealStatus.REGISTERING) {
      return 1;
    } else if (listItemModel.dealStatus == DealStatus.REGISTERED) {
      return 1;
    } else {
      return 0.5;
    }
  }

  Text getText() {
    if (listItemModel.dealStatus == DealStatus.REGISTERING) {
      return Text(
        '등록중',
        style: AppTextStyle.white_14_w400,
      );
    } else if (listItemModel.dealStatus == DealStatus.REGISTERED) {
      return Text(
        '등록완료',
        style: AppTextStyle.white_14_w400,
      );
    } else {
      return Text(
        '거래완료',
        style: AppTextStyle.white_14_w400,
      );
    }
  }

  Widget _getDateTime(Alignment align) {
    return Align(
      alignment: align,
      child: TextButton.icon(
        onPressed: null,
        icon: Icon(
          Icons.timelapse_outlined,
          color: Colors.white,
        ),
        label: Text(
          '등록시간 : ${listItemModel.dateTime}',
          style: AppTextStyle.white_14_w400,
        ),
      ),
    );
  }

  Widget _copyMessage(Alignment align) {
    return Align(
      alignment: align,
      child: TextButton.icon(
        onPressed: () {
          Clipboard.setData(ClipboardData(
                  text:
                      '\\w ${listItemModel.battleTagId} 게시판ID:${listItemModel.boardId} 거래를 원합니다.'))
              .then((value) {
            showToast(message: '복사되었습니다.');
          });
        },
        icon: Icon(Icons.message),
        label: Text('메시지복사', style: AppTextStyle.white_14_w400),
      ),
    );
  }

  Widget _getDiabloId(Alignment align) {
    return Container(
      alignment: align,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/icons/diablo2.png'),
          ),
          SizedBox(
            width: 8,
          ),
          Text('아이디 : ${listItemModel.diabloId}',
              style: AppTextStyle.white_14_w400),
        ],
      ),
    );
  }

  Widget _getBattleTag(Alignment align) {
    return Container(
      alignment: align,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/icons/battlenet.png'),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: listItemModel.battleTagId),
              ).then((value) {
                showToast(message: '복사되었습니다.');
              });
            },
            child: Text('배틀태그 : ${listItemModel.battleTagId}',
                style: AppTextStyle.white_14_w400),
          ),
        ],
      ),
    );
  }
}
