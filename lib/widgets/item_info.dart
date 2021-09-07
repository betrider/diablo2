import 'package:flutter_diablo2_exchange/index.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
          color: ItemColor.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                '+7% 매우 빠른 회복속도 증가매우 빠른 회',
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
              
            ],
          )),
    );
  }
}