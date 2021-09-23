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
          listItemModel.itemImagePath.isEmpty
              // ? Image.asset('assets/images/image-not-found.jpeg')
              ? Image.asset('assets/images/sample_item.png')
              : Image.network(listItemModel.itemImagePath),
          Container(
            color: Colors.grey[850],
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Responsive.isMobile(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _getDateTime(), //등록시간
                      SizedBox(
                        height: 4,
                      ),
                      _copyMessage(), //메시지복사
                      SizedBox(
                        height: 4,
                      ),
                      _getBattleTag(), //배틀태그
                      SizedBox(
                        height: 4,
                      ),
                      _getDiabloId(), //디아블로 아이디
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: _getDateTime() //등록시간
                              ),
                          Expanded(
                            flex: 1,
                            child: _copyMessage(), //메시지복사
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: _getBattleTag(), //배틀태그
                          ),
                          Expanded(
                            child: _getDiabloId(), //디아블로 아이디
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[800],
            padding: EdgeInsets.all(8),
            child: SelectableText(
              listItemModel.memo,
              style: AppTextStyle.white_14_w400,
            ),
          ),
        ],
      ),
    );
  }

  Align _getDateTime() {
    return Align(
      alignment: Alignment.center,
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

  Align _getDiabloId() {
    return Align(
      alignment: Alignment.center,
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

  Align _getBattleTag() {
    return Align(
      alignment: Alignment.center,
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

  Align _copyMessage() {
    return Align(
      alignment: Alignment.center,
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
}
