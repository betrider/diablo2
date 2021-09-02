import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';

class ExchangeStandardScreen extends StatelessWidget {
  const ExchangeStandardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 900,
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
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
              _getItem(),
              SizedBox(height: 16,),
            ],
          ),
        )
      ),
    );
  }

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
