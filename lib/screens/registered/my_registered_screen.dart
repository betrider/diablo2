import 'package:flutter_diablo2_exchange/index.dart';

class MyRegisteredScreen extends StatefulWidget {
  @override
  State<MyRegisteredScreen> createState() => _MyRegisteredScreenState();
}

class _MyRegisteredScreenState extends State<MyRegisteredScreen> {
  bool _value1 = true;
  bool _value2 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
        color: Colors.grey[900],
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context)
              ? kDefaultPadding
              : kDefaultPadding * 4,
          vertical: kDefaultPadding * 2,
        ),
        child: Column(
          children: [
            _getExchangeType(context),
            SizedBox(height: kDefaultPadding * 2),
            //TODO
          ],
        ));
  }

  Row _getExchangeType(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: CustomTitle.size20('거래소 유형'),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.blue,
          ),
          child: Checkbox(
            value: _value1,
            onChanged: (bool? value) {
              setState(() {
                _value1 = value!;
              });
            },
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _value1 = !_value1;
            });
          },
          child: Text(
            '스탠',
            style: AppTextStyle.white_14_w400,
          ),
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.blue,
          ),
          child: Checkbox(
            value: _value2,
            onChanged: (bool? value) {
              setState(() {
                _value2 = value!;
              });
            },
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _value2 = !_value2;
            });
          },
          child: Text(
            '래더',
            style: AppTextStyle.white_14_w400,
          ),
        ),
      ],
    );
  }
}
