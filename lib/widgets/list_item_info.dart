import 'package:flutter_diablo2_exchange/index.dart';

class ListItemInfo extends StatelessWidget {
  const ListItemInfo({required this.listItemModel});

  final ListItemModel listItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        color: Color.fromRGBO(0, 0, 0, 0.9),
      ),
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.grey[850],
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text('카테고리 : 유니크 > 무기 > 할배검',
                    style: AppTextStyle.white_14_w400),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            height: 1,
          ),
          listItemModel.itemImagePath.isEmpty
              ? Container()
              // ? Image.asset('assets/images/sample_item.png')
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
                                child:
                                    _getDateTime(Alignment.centerLeft)), //등록시간
                            Expanded(
                                child:
                                    _copyMessage(Alignment.centerLeft)), //메시지복사
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                    _getBattleTag(Alignment.centerLeft)), //배틀태그
                            Expanded(
                                child: _getDiabloId(
                                    Alignment.centerLeft)), //디아블로 아이디
                          ],
                        ),
                      ],
                    )),
        ],
      ),
    );
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
                      '\\w ${listItemModel.diabloId} 게시판ID:${listItemModel.boardId} 거래를 원합니다.'))
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
          Text('배틀태그 : ${listItemModel.battleTagId}',
              style: AppTextStyle.white_14_w400),
        ],
      ),
    );
  }
}
